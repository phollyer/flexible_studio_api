require 'builder/lib/builder/reg_exp'

include Builder::RegExp

module Builder
  module Utils

    # => ============================
    #
    # => Convert a camel case string to a const
    #
    # => ============================

    def convert_camel_to_const camel
      const = ""
      camel = camel.swap_initial(camel) if camel.match(/^[A-Z]/)
      puts camel
      camel.each_char do |char|
        puts "Curr Char:\t#{char}"
        if char.match(/[a-z]/)
          const << char.upcase
        else
          const << "_" + char      
        end
        puts "Const:\t#{const}"
      end

      const
    end
    # Swap an initial either upcase or downcase without affecting the rest of the String

    def swap_initial(str, direction=nil)
      vals = str.split("")
      if direction == "up" || direction == "down"
        # vals[0].call("#{direction}case!")
      else
        vals[0] = vals[0].swapcase
      end

      vals.join
    end
    
  end
end