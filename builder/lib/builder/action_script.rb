require 'builder/lib/builder/read'
require 'builder/lib/builder/reg_exp'
require 'builder/lib/builder/utils'

include Builder::Read
include Builder::RegExp
include Builder::Utils

module Builder

  module Imports

    def configure_import_statements file_content
      imports = file_content.scan(all_imports_reg_exp)

      match = false
      
      imports.each do|import|
        file_content.sub!(import,"")
        import.strip!
        match = true if import.match(result_event_import_reg_exp)
      end

      imports << result_event_import_reg_exp.source if match      
      imports.sort!

      import_block = "\r\n"
      imports.each do |import|
        import_block << "\t#{import}\r\n\r\n"
      end

      file_content.insert((file_content =~ start_of_package_reg_exp ) + 1,import_block)

      file_content
    end

  end
  
  module Metadata

    def add_missing_event_metadata_comments properties, file_content
      properties.each do |prop|
        @property = prop
        @event = convert_prop_to_event(@property)

        match = missing_event_metadata_reg_exp(swap_initial(prop)).match(file_content)

        if match
          comments = read_template(comment_template_path("missing_event_metadata")) + "\r\n" + match[0]

          test = match[0].scan(swap_initial(@property))

          file_content.sub!(missing_event_metadata_reg_exp(swap_initial(prop)),comments) if test.size > 0 unless comment_found? file_content, comments
        end
      end

      file_content
    end

    def add_result_event_metadata file_content
      unless file_content.match(result_event_metadata_reg_exp)
        metadata = read_template(action_script_template("result_event_metadata"))
        file_content.gsub!(bindable_reg_exp, "#{metadata}\r\n\t[Bindable")
      end

      file_content
    end
    
  end
  
  module Methods

    def add_result_to_class_method file_content
      file_content = add_result_method(add_result_event_metadata(file_content))

      file_content
    end

    def add_class_result_method file_content
      method = read_template actionscript_template("class_result_method")
      file_content.gsub!(start_of_send_result_reg_exp,"#{method}\r\n\t}\r\n}")
      
      file_content
    end

    def add_result_method file_content
      unless file_content.match(send_result_reg_exp)
        method = read_template action_script_template("result_method")

        file_content.gsub!(end_of_send_result_reg_exp,"#{method}\r\n\t}\r\n}")
      end

      file_content
    end

  end
  
  module ActionScript
    include Imports
    include Metadata
    include Methods

    def class_method_dispatches_a_result? file_content
      match = file_content.scan(class_dispatches_a_result_reg_exp?)
      match.size > 0
    end
  end

end