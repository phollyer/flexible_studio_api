desc "Find and Replace values across a project"
task :find_and_replace, [:find_val, :replace_val] do |t,args|
     find = /#{args.find_val}/
     replace = args.replace_val
     files = Dir['src/api/**/*.as']
     files.each do |file|
        f = File.open(file, "r")
        s = f.read
        if s.match(find)
          s.gsub!(find, replace)
          dir = File.split(file)[0]
          filename = File.split(file)[1]
          filename.gsub!(find, replace)
          file = File.join dir, filename
          puts "Updating #{file}"
          new_file = File.new(file, "w")
          new_file.write(s)
        end
     end
end

desc "Add ASDoc comments to a Class and it's associated method Clases"
task :comment_class, [:class_name] do |t,args|
  comment_class_file args.class_name
  comment_class_methods args.class_name
end

desc "Add ASDoc comments to a Class definition"
task :comment_class_file, [:class_name] do |t,args|                       
  comment_class_file args.class_name
end

desc "Add ASDoc comments to a Class Method definition"
task :comment_class_method, [:class_name, :method_name] do |t, args|                       
  comment_class_method args.class_name, args.method_name
end

desc "Add ASDoc comments to all Methods of a particular Class"
task :comment_class_methods, [:class_name] do |t,args|
  comment_class_methods args.class_name
end
# => ===============================
#
# => Initialise
#
# => ===============================
def init class_name,method_name=nil
  require "erb"

  @properties = []

  init_class class_name
  init_method method_name if method_name

  load_northcode_alternatives
  set_up_nc_alternatives
end

def init_class class_name
  @class_name = class_name
  @class_dir = swap_initial(@class_name)

  @file_path = get_class_file_path

  @comments_reg_exp = {:class                   => /\tpublic class #{@class_name} extends Kernel/,
                       :class_constructor       => /\t\tpublic function #{@class_name}/,
                       }
end

def init_method method_name
  @method_name = method_name

  if @method_name.match(/(ClearNotify)|(On[A-Z])/)
    @method_dir = "notifiers"
  else
    @method_dir = swap_initial(@method_name)
  end

  @file_path = get_method_file_path

  @comments_reg_exp = {:method_class            => /\tpublic class #{@method_name} extends #{@class_name}/,
                       :method_constructor      => /\t\tpublic function #{@method_name}/,
                       :method                  => /\t\tpublic function #{swap_initial(@method_name)}/,
                       :result_method           => /\t\toverride protected function sendResult/,
                       :result_event_metadata   => /\t\[Event\(name=\"result/
                       }
end
# => ===============================
#
# => Read / Write
#
# => ===============================
def load_northcode_alternatives
  nc = File.open("NORTHCODE","r").read
  @nc_alternatives = {}

  nc.split("\n").each do |line|
    alts = line .split(" => ")
    @nc_alternatives[eval(":#{alts[0]}")] = alts[1]
  end
end

def read_file
  puts "Reading:\t#{@file_path}"
  
  file = File.open(@file_path,"r")

  @file = file.read if file

  file
end

def write_file
  file = File.new @file_path,"w"
  puts "Writing:\t#{@file_path}"
  file.write(@file)
end

# => ===============================
#
# => Comments
#
# => ===============================
def comment_class_file class_name
  init class_name

  if read_file
    add_result_to_class_file

    @comments_reg_exp.each { |key,value| add_comments(key,value)  }

    write_file
  else
    puts "Failed:\t@file_path"
  end
end

def comment_class_method class_name,method_name
  init class_name, method_name

  if read_file
    extract_properties

    add_result_to_class_method if class_method_dispatches_a_result?

    @comments_reg_exp.each { |key,value| add_comments(key,value)  }

    add_missing_event_metadata_comments
    add_property_comments

    write_file
  else
    puts "Failed:\t@file_path"
  end
end

def comment_class_methods class_name
  file_list = Dir[File.join "src","api",@class_dir,"**","*.as"]
  file_list.sort!
  @method_list = []

  file_list.each do |file|
    file_name = File.split(file)[1]
    method_name = file_name.split(".")[0]
    puts method_name
    @method_list << method_name if method_name != @class_name
  end

  @method_list.each {|method| comment_class_method @class_name,method}
end

def add_comments(match_type,match_data)
  match = match_data.match(@file)
  
  if match
    comments = get_template(match_type) + "\r\n" + match[0]

    @file.gsub!(match_data, comments)
  end
end

def add_missing_event_metadata_comments
  @properties.each do |prop|
    @property = prop
    @event = convert_prop_to_event(@property)
    
    reg_exp = /\t\[Event\(name=\"missing\w+\"/
    match = reg_exp.match(@file)
    
    if match
      comments = get_template("missing_event_metadata") + "\r\n" + match[0]

      test = match[0].scan(swap_initial(@property))

      @file.sub!(reg_exp,comments) if test.size > 0
    end
  end
end

def add_property_comments
  @properties.each do |prop|
    reg_exp = /\t\tpublic var #{prop}:\w+ = \"*\w+/
    match = reg_exp.match(@file)
    
    if match
      @property_default_value = match[0].split(" ")[4]
      @property_default_value.gsub!(/\"/, "")

      comments = get_template("property") + "\r\n" + match[0]
      @file.sub!(reg_exp,comments)
    end
  end
end
# => ===============================
#
# => UTILS
#
# => ===============================
def add_result_to_class_file
  add_class_result_method
end

def add_result_to_class_method
  add_result_event_metadata
  add_result_method
end

def add_result_event_metadata
  template_path = File.join "src","templates","actionscript","result_event_metadata.erb"
  template = ERB.new File.new(template_path,"r").read
  metadata = template.result(binding)

  reg_exp = /\t\[Bindable/

  @file.gsub!(reg_exp, "#{metadata}\r\n\t[Bindable")
end

def add_class_result_method
  if !@file.match(/override protected function sendResult/)
    template_path = File.join "src","templates","actionscript","class_result_method.erb"
    template = ERB.new File.new(template_path,"r").read
    method = template.result(binding)

    reg_exp = /\t\}\r\n\}/

    @file.gsub!(reg_exp,"#{method}\r\n\t}\r\n}")
    @comments_reg_exp[:class_result_method] = /\t\toverride protected function sendResult/
  end
end

def add_result_method
  template_path = File.join "src","templates","actionscript","result_method.erb"
  template = ERB.new File.new(template_path,"r").read
  method = template.result(binding)

  reg_exp = /\t\}\r\n\}/

  @file.gsub!(reg_exp,"#{method}\r\n\t}\r\n}")
end

def class_method_dispatches_a_result?
  reg_exp = /(\/\/ Result)|(\[Event\(name=\"result)|(function sendResult)/
  reg_exp.match(@file)
end

def convert_prop_to_event(prop)
  event = ""
  prop.each_char do |char|
    if char.upcase!
      event << char
    else
      event << "_" + char
    end
  end
  
  event
end

def extract_properties
  matches = @file.scan(/public var \w+/)
  matches.each do |match|
    @properties << match.split(" ")[2]
  end
end

def get_file_path
  File.join  "src","api"
end

def get_class_path
  File.join get_file_path,@class_dir
end

def get_class_file_path
  File.join get_class_path,"#{@class_name}.as"
end

def get_method_file_path
  File.join get_class_path,@method_dir,"#{@method_name}.as"
end

def get_template(temp_type)
  template_path = File.join "src","templates","asdoc_comments","#{temp_type}_definition.erb"

  template = ERB.new File.new(template_path,"r").read

  comments = template.result(binding)
end

def set_up_nc_alternatives
  if @nc_alternatives.has_key?(@class_name.to_sym)
    @nc_class_name = @nc_alternatives[@class_name.to_sym]
  else
    @nc_class_name = @class_name
  end
  if @method_dir
    if @nc_alternatives.has_key?(@method_dir.to_sym)
      @nc_method_name = @nc_alternatives[@method_dir.to_sym]
    else
      @nc_method_name = @method_dir
    end
  end
end

def swap_initial(str, direction=nil)
  vals = str.split("")
  if direction == "up" || direction == "down"
    vals[0].call("#{direction}case!")
  else
    vals[0] = vals[0].swapcase
  end

  s = vals.join

  s
end