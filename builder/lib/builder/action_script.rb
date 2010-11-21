require 'builder/lib/builder/read'
require 'builder/lib/builder/reg_exp'
require 'builder/lib/builder/utils'

include Builder::Read
include Builder::RegExp
include Builder::Utils

module Builder

  module Events

    def add_result_to_event file_content
      file_content.insert((file_content =~ start_of_class_reg_exp ) + 2,"\r\n\t\tpublic static const RESULT:String = \"result\";")
    end

    def configure_static_consts file_content
      consts = file_content.scan(every_event_const_reg_exp)

      consts.uniq!
      consts.sort!
      
      consts_with_comments = []
      consts.each do |const|
        if const_is_unwanted? const
          file_content.sub!(const,"")
          puts "const:\t#{const}\tNot wanted"
        else
          puts "const:\t#{const}\tWanted"
          const.strip!
          match = file_content.match(event_const_with_comments_reg_exp(const))
          
          if match
            consts_with_comments << match[0]
          else
            consts_with_comments << file_content.match(event_const_without_comments_reg_exp(const))[0]
          end
        end
      end

      consts_with_comments.each do |const|
        file_content.sub!(const,"")
        const.strip!
      end

      const_block = ""
      consts_with_comments.each do |const|
        const_block << "\r\n\t\t#{const}"
      end

      file_content.insert((file_content =~ start_of_class_reg_exp ) + 2,const_block)
      file_content
    end

    def const_is_unwanted? const
      const.match(unwanted_consts_reg_exp)
    end

    def event_has_consts? file_content
      file_content.scan(every_event_const_reg_exp).size > 0
    end

    def result_event_exists? file_content
      file_content.match(result_event_const_reg_exp)
    end

  end

  module Imports

    def add_result_event_import_statement file_content
      file_content.insert((file_content =~ start_of_package_reg_exp ) + 1,"\r\n\t#{result_event_import_reg_exp.source}")
    end

    def configure_import_statements file_content
      imports = file_content.scan(all_imports_reg_exp)
      required_imports = set_required_imports file_content
      
      imports.each do|import|
        file_content.sub!(import,"")
        import.strip!
      end

      imports << result_event_import_reg_exp.source unless file_content.match(result_event_import_reg_exp)
      
      imports.uniq!
      imports.sort!

      import_block = ""
      imports.each do |import|
        import_block << "\r\n\t#{import}\r\n"
      end

      file_content.insert((file_content =~ start_of_package_reg_exp ) + 1,import_block.rstrip!)

      file_content
    end

    def result_event_import_statement_exists? file_content
      file_content.match(result_event_import_reg_exp)
    end
    private

    # => =======================================
    #
    # => Create a list of all Classes
    # => Store it in a hash
    # => Use it to ensure all defined Classes are imported into the Class file
    # => Stop the program if any unknown Classes are found
    #
    # => =======================================
    def set_required_imports file_content
      imports = file_content.scan(every_defined_class_reg_exp)

      required_imports = {:packages => [],
                          :classes  => [],
                          :unknowns => []
                         }

      imports.each do |import|
        if import.match(package_seperator_reg_exp)
          required_imports[:packages] << "import #{import};"
        elsif import.match(new_class_reg_exp)
          required_imports[:classes] << import.split(" ")[1]
        else
          required_imports[:unknowns] << {:import => import,
                                          :class  => @class_name,
                                          :method => @method_name
                                         }
        end
      end

      if required_imports[:unknowns].size > 0
        puts "Unknown Classes found\r\n"
        puts required_imports[:unknowns].inspect
        exit
      end

      required_imports.each { |key,value| value.uniq! }

      required_imports
    end

  end
  
  module Metadata

    def add_missing_event_metadata file_content
      missing_methods = file_content.scan(missing_method_reg_exp)

      missing_methods.each do |method|     
        prop = method.match(/[A-Z]\w+/)
        prop = swap_initial(prop[0])
        unless file_content.match(missing_event_metadata_reg_exp(method))
          @property_up_case = swap_initial(prop)
          metadata = read_template(action_script_template("missing_event_metadata"))
          file_content.gsub!(bindable_reg_exp, "#{metadata}\r\n\t[Bindable") unless metadata_exists? "missing#{@property_up_case}",file_content
        end
        
      end

      file_content
    end

    def add_result_event_metadata file_content
      metadata = read_template(action_script_template("result_event_metadata"))

      file_content.gsub!(bindable_reg_exp, "#{metadata}\r\n\t[Bindable")
      
      file_content
    end

    def metadata_exists? method,file_content
      file_content.match(missing_event_metadata_reg_exp(method))
    end

    def result_metadata_exists? file_content
      file_content.match(result_event_metadata_reg_exp)
    end
    
  end
  
  module Methods

    def add_result_to_class_method file_content
      file_content = add_result_method(file_content)

      file_content
    end

    def add_class_result_method file_content
      method = read_template action_script_template("class_result_method")
      file_content.gsub!(start_of_send_result_reg_exp,"#{method}\r\n\t}\r\n}")
      
      file_content
    end

    def add_result_method file_content
      method = read_template action_script_template("result_method")

      file_content.gsub!(start_of_send_result_reg_exp,"#{method}\r\n\t}\r\n}")

      file_content
    end

    def class_method_dispatches_a_result? file_content
      file_content.match(class_dispatches_a_result_reg_exp?)
    end

    def extract_missing_methods file_content
      file_content.scan(missing_method_reg_exp)
    end

    def extract_parameters file_content, method_name
      param_list = []

      method = file_content.match(public_function_reg_exp swap_initial method_name)

      if method
        params = method[0].scan(public_function_name_type_separator_reg_exp)
        params.each {|param| param_list << param.split(":")[0]}
      end

      param_list
    end

    def result_method_exists? file_content
      file_content.match(send_result_reg_exp)
    end

  end

  module Properties
    # Convert an ActionScript Property into a reference to an Event
    # Example: myProperty => MY_PROPERTY
    def convert_prop_to_event(prop)
      convert_camel_to_const prop
    end
    
    def extract_properties file_content
      matches = file_content.scan(public_var_reg_exp)
      props = []
      matches.each do |match|
        props << match.split(" ")[2]
      end

      props
    end
  end
  
  module ActionScript
    include Events
    include Imports
    include Metadata
    include Methods
    include Properties
  end

end