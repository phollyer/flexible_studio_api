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
      prev_char = ""
      camel = camel.swap_initial(camel) if camel.match(/^[A-Z]/)
      camel.each_char do |char|
        if char.match(/[a-z]/)
          const << char.upcase
        elsif prev_char.match(/[A-Z]/)
          const << char
        else
          const << "_" + char      
        end

        prev_char = char
      end

      const
    end

    def convert_const_to_camel const
      camel = ""
      prev_char = ""
      const.each_char do |char|
        if prev_char == "_"
          camel << char
        else
          camel << char.downcase! unless char == "_"
        end

        prev_char = char
      end

      camel
    end

    def fix_const const
      fixed = nil
      if const.match(/_[A-Z]$/)
        const.sub!(/_[A-Z]$/,const.match(/_[A-Z]$/)[0].split("")[1])
      end
      puts const
      indexes_to_delete = []
      if const.match(/_[A-Z]_/)
        chars = const.split("")
        chars.each_index do |index|
          if chars[index] == "_" && chars[index - 2] == "_"
            indexes_to_delete << index
          end
        end

        indexes_to_delete.reverse!
        puts indexes_to_delete

        indexes_to_delete.collect { |index| chars[index] = ""  }

        fixed = chars.join("")
        puts fixed
      end

      if fixed
        new_const = fixed
      else
        new_const = const
      end

      new_const
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