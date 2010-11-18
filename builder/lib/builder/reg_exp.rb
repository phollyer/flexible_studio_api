module Builder
  module RegExp

    def all_imports_reg_exp
      /\s+import\s+[\w+\.]+;/
    end
    
    def bindable_reg_exp
      /\t\[Bindable/
    end
    
    def class_comments_reg_exp
      {:class                   => /\tpublic class #{@class_name} extends Kernel/,
       :class_constructor       => /\t\tpublic function #{@class_name}/,
      }
    end

    def class_dispatches_a_result_reg_exp?
      /(\/\/ Result)|(\[Event\(name=\"result)|(function sendResult)/
    end

    def empty_line_reg_exp
      /[ +\t+]\r\n/
    end

    def method_comments_reg_exp
      {:method_class            => /\tpublic class #{@method_name} extends #{@class_name}/,
       :method_constructor      => /\t\tpublic function #{@method_name}/,
       :method                  => /\t\tpublic function #{swap_initial(@method_name)}/,
       :result_method           => /\t\toverride protected function sendResult/,
       :result_event_metadata   => /\t\[Event\(name=\"result/
      }
    end

    def method_notifier_reg_exp
      /(ClearNotify)|(On[A-Z])/
    end

    def missing_event_metadata_reg_exp event="\w+"
      /\t\[Event\(name=\"missing#{event}\"/
    end

    def package_definition_reg_exp
      /package\s[\w+\.]+/
    end

    def public_function_reg_exp method_name
      /public function #{method_name}\(\s*.+/
    end

    def public_function_name_type_separator_reg_exp
      /\w+:\w+/
    end

    def public_var_with_value_reg_exp prop_name
      /\t\tpublic var #{prop_name}:\w+ = \"*\w+/
    end

    def public_var_reg_exp
      /public var \w+/
    end

    def result_event_import_reg_exp
      /import api.#{@class_dir}.#{@method_dir}.#{@method_name}Event;/
    end

    def result_event_metadata_reg_exp
      /\[Event\(name=\"result/
    end

    def send_result_reg_exp
      /override protected function sendResult/
    end

    def start_of_package_reg_exp
      /\{/
    end

    def start_of_send_result_reg_exp
      /\t\}\r\n\}/
    end
  end
end