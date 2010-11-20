require 'builder/lib/builder/reg_exp'

include Builder::RegExp

module Builder
  module CleanUp
    def clean_up_class_file file_content
      file_content = clean_up file_content
    end
    def clean_up_event_class_file file_content
      file_content = clean_up file_content
    end
    def clean_up_event_file file_content
      file_content = clean_up file_content
    end
    def clean_up_method_file file_content
      file_content = clean_up file_content
    end

    def clean_up file_content
      match = unwanted_comments_reg_exp.match(file_content)
      
      if match
        matching = true

        while matching
          white_space = match[0].match(/\s*/)
          file_content.gsub!(match[0], "#{white_space}/**")
          match = unwanted_comments_reg_exp.match(file_content)
          matching = false unless match
        end
      end
      
      file_content
    end
  end
end