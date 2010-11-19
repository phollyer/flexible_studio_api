require 'builder/lib/builder/action_script'
require 'builder/lib/builder/comments'
require 'builder/lib/builder/init'
require 'builder/lib/builder/northcode_alts'
require 'builder/lib/builder/read'
require 'builder/lib/builder/reg_exp'
require 'builder/lib/builder/write'

include Builder::ActionScript
include Builder::Comments
include Builder::Init
include Builder::NorthcodeAlts
include Builder::Read
include Builder::RegExp
include Builder::Write

class Build

  def initialize class_name, method_name=nil
    @class_name = class_name
    @method_name = method_name
    @parameters = []
    @properties = []

    init_class @class_name
    init_method @method_name if @method_name
    
    load_nc_alts
    
    if @method_name
      set_up_nc_alts @class_name,swap_initial(@method_name)
    else
      set_up_nc_alts @class_name
    end
  end
  
  def comment_class_file
    if read_file class_file_path
      @file_content = file_content
      comments_reg_exp = class_comments_reg_exp

      unless @file_content.match(send_result_reg_exp)
        add_class_result_method @file_content
        comments_reg_exp[:class_result_method] = send_result_reg_exp
      end

      comments_reg_exp.each { |key,value| @file_content = add_comments(key,value,@file_content)  }

      write_file class_file_path, @file_content
    end
  end

  def comment_class_method
      if read_file method_file_path
        @file_content = file_content
        @parameters = extract_parameters @file_content,@method_name
        @properties = extract_properties @file_content

        if class_method_dispatches_a_result? @file_content
          @file_content = add_result_event_import_statement(@file_content) unless result_event_import_statement_exists? @file_content
          @file_content = add_result_to_class_method(@file_content) unless result_method_exists? @file_content
          @file_content = add_result_event_metadata(@file_content) unless result_metadata_exists? @file_content
        end

        @file_content = configure_import_statements @file_content
        
        method_comments_reg_exp.each { |key,value| @file_content = add_comments(key,value,@file_content)  }

        @file_content = add_missing_event_metadata(@file_content)
        @file_content = add_missing_event_metadata_comments(@file_content)
        @file_content = add_property_comments @properties, @file_content

        write_file(method_file_path,@file_content)
      else
        puts "Failed:\t@file_path"
        exit
      end

  end

  def comment_all_class_methods
    file_list = Dir[all_class_methods_path]
    file_list.sort!
    @method_list = []

    file_list.each do |file|
      file_name = File.split(file)[1]
      method_name = file_name.split(".")[0]
      @method_list << method_name if method_name != @class_name
    end

    @method_list.each do |method|
      initialize @class_name,method
      comment_class_method
    end
  end
  
end