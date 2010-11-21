module Builder
  module FilePaths

    def action_script_template temp_name
      File.join "src","templates","actionscript","#{temp_name}.erb"
    end

    def all_class_methods_path
      File.join "src","api",@class_dir,"**","*.as"
    end

    def comment_template_path temp_type
      File.join "src","templates","asdoc_comments","#{temp_type}_definition.erb"
    end

    def get_class_file_path class_name
      File.join get_class_path,"#{class_name}.as"
    end

    def get_class_path
      File.join get_file_path,@class_dir
    end

    def get_event_class_file_path event_class_name
      File.join get_file_path, "events",@class_dir, "#{event_class_name}.as"
    end

    def get_event_file_path event_name
      File.join get_file_path,"events",@class_dir,@method_dir,"#{event_name}.as"
    end

    def get_file_path
      File.join  "src","api"
    end

    def get_kernel_path
      File.join(get_file_path, "Kernel.as" )
    end

    def get_method_file_path method_name
      File.join get_class_path,@method_dir,"#{method_name}.as"
    end
    
  end
end