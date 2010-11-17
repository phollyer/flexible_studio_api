require 'builder/lib/builder/reg_exp'

include Builder::RegExp

module Builder
  module Utils
    # Swap an initial either upcase or downcase without affecting the rest of the String

    def swap_initial(str, direction=nil)
      vals = str.split("")
      if direction == "up" || direction == "down"
        vals[0].call("#{direction}case!")
      else
        vals[0] = vals[0].swapcase
      end

      vals.join
    end

    # Convert an ActionScript Property into a reference to an Event
    # Example: myProperty => MY_PROPERTY
    def convert_prop_to_event(prop)
      event = ""
      prop.each_char do |char|
        if char.upcase!
          event << char
        else
          event << "_" + char
        end
      end

      event
    end

    def comment_found? content, comment
      content.scan(comment).size > 0
    end

    def extract_parameters file_content, method_name
      param_list = []
 
      method = file_content.match(public_function_reg_exp swap_initial method_name)

      if method
        params = method[0].scan(public_function_name_type_separator_reg_exp)
        params.each {|param| param_list << param.split(":")[0]}
      end

      param_list
    end

    def extract_properties file_content
      matches = file_content.scan(public_var_reg_exp)
      props = []
      matches.each do |match|
        props << match.split(" ")[2]
      end

      props
    end
    
  end
end