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

  def initialize class_name, method_name=nil
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
      set_up_nc_alts @class_name
    end
  end

  def comment_class_event
    if read_event_class_file event_class_file_path
      @event_class_file = event_class_file_content
      
      @event_class_file.gsub!("KernelEvent","SWFStudioEvent")

      @event_class_file = configure_static_consts @event_class_file
      @event_class_file = add_event_class_comments @event_class_file if event_has_consts? @event_class_file

      @event_class_file = clean_up_event_class_file @event_class_file

      write_file event_class_file_path, @event_class_file
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

      write_file class_file_path, @class_file
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
        
        write_file(method_file_path,@method_file)
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
      puts "Start clean_up file"
      @event_file = clean_up_event_file @event_file
      puts "End clean_up file"
      write_file(event_file_path,@event_file)
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
      comment_class_method_event
    end
  end
  
end