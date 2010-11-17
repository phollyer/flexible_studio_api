require 'builder/lib/builder/file_paths'
require 'builder/lib/builder/read'
require 'builder/lib/builder/reg_exp'
require 'builder/lib/builder/utils'

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

    def add_property_comments properties,method_name,file_content
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