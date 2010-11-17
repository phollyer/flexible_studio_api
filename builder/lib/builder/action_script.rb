require 'builder/lib/builder/read'
require 'builder/lib/builder/reg_exp'
require 'builder/lib/builder/utils'

include Builder::Read
include Builder::RegExp
include Builder::Utils

module Builder
  
  module Metadata

    def add_missing_event_metadata_comments properties, file_content
      properties.each do |prop|
        property = prop
        @event = convert_prop_to_event(property) # This needs looking at. Why? What?

        match = missing_event_metadata_reg_exp.match(file_content)

        if match
          comments = read_template(comment_template_path("missing_event_metadata")) + "\r\n" + match[0]

          test = match[0].scan(swap_initial(property))

          file_content.sub!(missing_event_metadata_reg_exp,comments) if test.size > 0 unless comment_found? file_content, comments
        end
      end

      file_content
    end

    def add_result_event_metadata file_content
      unless file_content.match(result_event_metadata_reg_exp)
        metadata = read_template(result_event_metadata_template_path)

        file_content.gsub!(bindable_reg_exp, "#{metadata}\r\n\t[Bindable")
      end

      file_content
    end
    
  end
  
  module Methods

    def add_result_to_class_method file_content
      file_content = add_result_method add_result_event_metadata file_content

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

        file_content.gsub!(reg_exp,"#{start_of_send_result_reg_exp}\r\n\t}\r\n}")
      end

      file_content
    end

  end
  
  module ActionScript
    include Metadata
    include Methods

    def class_method_dispatches_a_result? file_content
      match = file_content.scan(class_dispatches_a_result_reg_exp?)
      match.size > 0
    end
  end

end