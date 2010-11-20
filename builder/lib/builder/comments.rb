require 'builder/lib/builder/action_script'
require 'builder/lib/builder/file_paths'
require 'builder/lib/builder/read'
require 'builder/lib/builder/reg_exp'
require 'builder/lib/builder/utils'

include Builder::Metadata
include Builder::FilePaths
include Builder::Read
include Builder::RegExp
include Builder::Utils

module Builder
  module Comments

    def add_comments(match_type,match_data, file_content)
      match = match_data.match(file_content)
      
      if match
        comments = read_template(comment_template_path(match_type))
        file_content.gsub!(match_data, comments + "\r\n" + match[0]) unless comment_found? file_content,comments
      end
      
      file_content
    end

    def add_event_const_comments file_content
      consts = file_content.scan(every_event_const_reg_exp)
      consts.each do |const|
        @event_const = const.match(event_const_reg_exp)
        @event_string = const.match(event_string_reg_exp)
        @event_string = @event_string[0].match(/\w+/)
        @event_properties = []
        event_props = file_content.scan(every_public_var_with_value_reg_exp)
        event_props.each do |prop|
          h = {:property => prop.scan(/\w+/)[2],
               :value    => prop.match(property_value_reg_exp)[0].match(/\w+/)[0]
              }
          @event_properties << h
        end
        
        comments = read_template(comment_template_path("event_constant"))
        
        file_content.sub!(const.strip!, "\r\n#{comments}\t\t#{const}") unless comment_found? file_content,comments
      end
      
      file_content
    end

    def add_missing_event_metadata_comments file_content
      metadata = file_content.scan(missing_event_metadata_reg_exp)
      metadata.each do |m_data|
        prop = m_data.match(/missing\w+/)
        @property = swap_initial(prop[0].match(/[A-Z]\w+/)[0])
        @event = convert_prop_to_event(@property) # @event => Used in missing_event_metadata template
        
        match = missing_event_metadata_reg_exp.match(file_content)

        if match
          comments = read_template(comment_template_path("missing_event_metadata")) + "\r\n" + match[0]

          test = match[0].scan(swap_initial(@property))

          file_content.sub!(missing_event_metadata_reg_exp,comments) if test.size > 0 unless comment_found? file_content, comments
        else
          puts "Error:\tProperty and Event are incompatible\r\n\tClass:\t#{@class_name}\r\n\tMethod:\t#{@method_name}\r\n\tProperty:\t#{prop}\r\n\tMeta:\t#{missing_event_metadata_reg_exp.source}"
          exit
        end
      end

      file_content
    end
    
    def add_property_comments properties,file_content
      properties.each do |prop|
        match = public_var_with_value_reg_exp(prop).match(file_content)

        if match
          @property_default_value = match[0].split(" ")[4]
          @property_default_value.gsub!(/\"/, "")

          comments = read_template(comment_template_path("property")) + "\r\n" + match[0]
          
          file_content.sub!(public_var_with_value_reg_exp(prop),comments) unless comment_found? file_content,comments
        end
      end

      file_content
    end
    
  end
end