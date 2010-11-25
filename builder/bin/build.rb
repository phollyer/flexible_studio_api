require 'builder/lib/builder/action_script'
require 'builder/lib/builder/clean_up'
require 'builder/lib/builder/comments'
require 'builder/lib/builder/init'
require 'builder/lib/builder/northcode_alts'
require 'builder/lib/builder/read'
require 'builder/lib/builder/reg_exp'
require 'builder/lib/builder/write'

include Builder::ActionScript
include Builder::CleanUp
include Builder::Comments
include Builder::Init
include Builder::NorthcodeAlts
include Builder::Read
include Builder::RegExp
include Builder::Write

class Build

  def initialize class_name=nil, method_name=nil
    if class_name
      @class_name = class_name
      @method_name = method_name
      @parameters = []
      @properties = []

      init_class @class_name
      init_event_class @class_name
      init_method @method_name if @method_name
      init_event @method_name if @method_name
      load_nc_alts

      if @method_name
        set_up_nc_alts @class_name,swap_initial(@method_name)
      else
        set_up_nc_alts @class_name if @class_name
      end
    end
  end

  def add_constants
    @actual_constants = []
    @new_constants = []
    @required_constants = []
    @method_list = []

    file_list = Dir['src/api/**/*.as']

    file_list.each do |file|
      file_content = read_file file
      constants = file_content.scan(every_swf_studio_event_type_const_reg_exp)
      constants.uniq!
      constants.sort!

      constants.collect {|x| @required_constants << x}
    end

    @required_constants.uniq!
    @required_constants.sort!

    @required_constants.collect! { |x| x = x.split(".")[1]  }

    @event_file = read_file get_swf_studio_event_file_path

    @actual_constants = @event_file.scan(every_event_const_reg_exp)

    @actual_constants.sort!
    @actual_constants.collect!{|x| x.strip!}
    
    @required_constants.each do |required|
      match = false
      @actual_constants.each do |actual|
        match = true if actual.match(required)
      end
      @new_constants << required unless match
    end

    @new_constants.each do |constant|
      insert_constant = "public static const #{constant} : String = \"#{convert_const_to_camel(constant)}\";"
      @actual_constants << insert_constant
      @actual_constants.sort!
      new_constant_index = @actual_constants.find_index(insert_constant)
      puts "#{new_constant_index}\t#{insert_constant}"
      if new_constant_index > 0
          @event_file.sub!(@actual_constants[new_constant_index-1],"#{@actual_constants[new_constant_index-1]}\r\n\t\t#{insert_constant}")
        else
          @event_file.sub!("\t{","\t{\r\n#{insert_constant}")
      end
    end

    puts @event_file

    puts @actual_constants.inspect
    puts @new_constants.inspect
  end

  def add_methods_to_kernel
    @actual_missing_methods = []
    @new_missing_methods = []
    @required_missing_methods = []
    class_paths = get_class_paths

    class_paths.each do |path|
      class_dir = path.scan(/\w+/)[2]
      class_name = swap_initial(class_dir)
      
      if class_name != "Events" && class_name != "Errors" && class_name != "Vos"
      
        initialize class_name

        set_method_list

        @method_list.each do |method|
          initialize class_name,method
          @method_file = read_method_file method_file_path

          set_required_missing_methods @method_file
        end
        
      end
    end

    init_kernel
    @kernel_file = read_kernel_file(kernel_file_path)
    @kernel_file = set_new_missing_methods @kernel_file

    if @kernel_file.rindex("}") == @kernel_file.length - 1
      write_file(kernel_file_path,@kernel_file)
    else
      puts "Error in Kernel"
      puts "================================"
      puts @kernel_file
      exit
    end    
  end

  def comment_class_event
    if read_event_class_file event_class_file_path
      @event_class_file = event_class_file_content
      
      @event_class_file.gsub!("KernelEvent","SWFStudioEvent")

      @event_class_file = configure_static_consts @event_class_file
      @event_class_file = add_event_class_comments @event_class_file if event_has_consts? @event_class_file

      @event_class_file = clean_up_event_class_file @event_class_file
      
      if @event_class_file == event_class_file_content
        puts "No Change"
      else
        puts "Changed"
        write_file event_class_file_path, @event_class_file
      end
    end
  end

  def comment_api
    class_paths = get_class_paths

    class_paths.each do |path|
      class_dir = path.scan(/\w+/)[2]
      class_name = swap_initial(class_dir)
      if class_name != "Events" && class_name != "Errors" && class_name != "Vos"
        initialize class_name
        comment_class_file
        comment_class_event
        comment_all_class_methods
      end
    end
  end
  
  def comment_class_file
    if read_class_file class_file_path
      @class_file = class_file_content
      comments_reg_exp = class_comments_reg_exp

      @class_file = add_class_result_method @class_file unless result_method_exists? @class_file

      comments_reg_exp[:class_result_method] = send_result_reg_exp
      comments_reg_exp.each { |key,value| @class_file = add_comments(key,value,@class_file)  }

      @class_file = clean_up_class_file @class_file

      if @class_file == class_file_content
          puts "No Change"
        else
          puts "Changed"
          write_file class_file_path, @class_file
      end
    end
  end

  def comment_class_method
      if read_method_file method_file_path
        @method_file = method_file_content
        @parameters = extract_parameters @method_file,@method_name
        @properties = extract_properties @method_file
        
        if class_method_dispatches_a_result? @method_file
          @method_file = add_result_event_import_statement(@method_file) unless result_event_import_statement_exists? @method_file
          @method_file = add_result_to_class_method(@method_file) unless result_method_exists? @method_file
          @method_file = add_result_event_metadata(@method_file) unless result_metadata_exists? @method_file
        end

        @method_file = configure_import_statements @method_file
        @method_file = add_missing_event_metadata(@method_file)
        
        method_comments_reg_exp.each { |key,value| @method_file = add_comments(key,value,@method_file)  }

        @method_file = add_missing_event_metadata_comments(@method_file)
        @method_file = add_property_comments(@properties,@method_file)
        
        @method_file = clean_up_method_file @method_file

        if @method_file == method_file_path
          puts "No Change"
        else
          puts "Changed"
          write_file(method_file_path,@method_file)
        end
      else
        puts "Failed:\t@file_path"
        exit
      end
  end
  
  def comment_class_method_event
    if read_event_file event_file_path
      @event_file = event_file_content
      
      if class_method_dispatches_a_result? @method_file
        if result_event_exists? @event_file
          puts "Result Event Exists:\t#{event_file_path}"
        else
          puts "Event Requires Result:\t#{event_file_path}"
          @event_file = add_result_to_event(@event_file)
        end
      end

      @event_file = configure_static_consts @event_file
      @event_file = add_event_const_comments @event_file if event_has_consts? @event_file
      @event_file = clean_up_event_file @event_file
      
      if @event_file == event_file_path
        puts "No Change"
      else
        puts "Changed"
        write_file(event_file_path,@event_file)
      end
    end
  end

  def comment_all_class_methods
    set_method_list
    
    @method_list.each do |method|
      initialize @class_name,method
      comment_class_method
      comment_class_method_event
    end
  end

  def get_class_paths
    dir_list = Dir['src/api/*']
    dir_list.sort!
    class_paths = []
    dir_list.each do |item|
      class_paths << item unless File.file?(item)
    end

    class_paths
  end

  def fix_constants
    file_list = Dir['src/api/**/*.as']

    fixed_constants = []
    file_list.each do |file|
      file_content = read_file file

      constants = file_content.scan(/[A-Z]+_[A-Z_]*/)
      constants.each do |const|
        puts const
        if const.match(/_[A-Z]_|_[A-Z]$/)
          puts "match"
          fixed_const = {:original => const,
                         :replace  => fix_const("#{const}")
          }
          puts fixed_const.inspect

          fixed_constants << fixed_const

          fixed_constants.each do |const|
            file_content.gsub!(const[:original],const[:replace])
          end

          write_file file,file_content if
                fixed_constants.size > 0
        end
      end
    end
  end

  def get_method_paths class_name
    dir_list = Dir[File.join "src","api",class_name,"*"]
    dir_list.sort!
    method_class_paths = []
    dir_list.each do |item|
      method_class_paths << item unless File.file?(item)
    end

    method_class_paths
  end

  def set_method_list
    file_list = Dir[all_class_methods_path]
    file_list.sort!
    @method_list = []

    file_list.each do |file|
      file_name = File.split(file)[1]
      method_name = file_name.split(".")[0]
      @method_list << method_name if method_name != @class_name
    end
  end

    def set_actual_missing_methods file_content
      missing_methods = set_missing_methods file_content

      missing_methods.each do |method|
        @actual_missing_methods << method
      end
    end

    def set_missing_methods file_content
      missing_methods = extract_missing_methods file_content
      missing_methods.uniq!
      missing_methods.sort!

      missing_methods
    end

    def set_required_missing_methods file_content
      missing_methods = set_missing_methods file_content

      missing_methods.each do |method|
        @required_missing_methods << method
      end
    end

    def set_new_missing_methods file_content
      set_actual_missing_methods file_content

      @new_missing_methods = []
      @required_missing_methods.each do |required_method|
        method_exists = false
        @actual_missing_methods.each do |actual_method|
          method_exists = true if required_method == actual_method
        end
        @new_missing_methods << required_method unless method_exists
      end

      @new_missing_methods.uniq!
      @new_missing_methods.sort!

      @new_missing_methods.each do |new_method|
        # Comments
        @missing_method = new_method
        @prop = @missing_method.match(/[A-Z]\w*/)[0]

        if @prop.match(/\<[AEIOU]/)
          @a_or_an = "an "
        else
          @a_or_an = @prop.match(/[aeiou]\Z/) ? "" : "a "
        end

        @event_const = convert_camel_to_const(@missing_method.match(/\w+/)[0])

        @missing_method_comments = read_template(comment_template_path("missing_method"))
        @missing_method_block = read_template(action_script_template("missing_method_in_kernel"))
        
        @actual_missing_methods << new_method
        @actual_missing_methods.sort!
        
        # Insert Method with Comments
        new_method_index = @actual_missing_methods.find_index(new_method)
        
        if new_method_index > 0
          method = @kernel_file.match(missing_method_block_reg_exp(@actual_missing_methods[new_method_index-1]))
        else
          method = @kernel_file.match(start_of_missing_methods_reg_exp)
        end
        
        replace = method[0] + "\r\n" + @missing_method_comments + "\r\n" + @missing_method_block
        @kernel_file.sub!(method[0], replace)
      end

      file_content
    end
end