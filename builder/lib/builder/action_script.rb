require 'builder/lib/builder/read'
require 'builder/lib/builder/reg_exp'
require 'builder/lib/builder/utils'

include Builder::Read
include Builder::RegExp
include Builder::Utils

module Builder

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

    def set_required_imports file_content
      imports = file_content.scan(every_defined_class_reg_exp)

      required_imports = {:packages => [],
                          :classes  => [],
                          :unknowns => []
                         }

      #file_content.sub!(missing_event_metadata_reg_exp(swap_initial(prop)),comments) if test.size > 0 unless comment_found? file_content, comments

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
      unless file_content.match(send_result_reg_exp)
        method = read_template action_script_template("result_method")

        file_content.gsub!(start_of_send_result_reg_exp,"#{method}\r\n\t}\r\n}")
      end

      file_content
    end

    def result_method_exists? file_content
      file_content.match(send_result_reg_exp)
    end

  end

  module Properties
    
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