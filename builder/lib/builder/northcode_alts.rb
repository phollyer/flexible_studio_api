module Builder
  module NorthcodeAlts

    attr_accessor :nc_class_name, :nc_method_name
    
    def load_nc_alts
      nc = File.open("NORTHCODE","r").read
      @nc_alts = {}

      nc.split("\n").each do |line|
        alts = line .split(" => ")
        @nc_alts[eval(":#{alts[0]}")] = alts[1]
      end
    end

    def set_up_nc_alts class_name,method_name=nil
      set_nc_class_name class_name
      set_nc_method_name method_name if method_name
    end

    private
    
    def set_nc_class_name class_name
      if @nc_alts.has_key?(class_name.to_sym)
        @nc_class_name = @nc_alts[class_name.to_sym]
      else
        @nc_class_name = class_name
      end
    end

    def set_nc_method_name method_name
      if method_name
        if @nc_alts.has_key?(method_name.to_sym)
          @nc_method_name = @nc_alts[method_name.to_sym]
        else
          @nc_method_name = method_name
        end
      end
    end
    
  end
end