require 'erb'

module Builder
  module Read
    attr_accessor :class_file_content, :event_file_content, :method_file_content

    def read_file path
      puts "Reading:\t#{path}"
      
      file = File.open(path,"r")

      if file
        file_content = file.read
        puts "OK"
      else
        puts "Error reading file"
      end

      file_content
    end

    def read_class_file path
      @class_file_content = read_file path
    end

    def read_event_file path
      @event_file_content = read_file path
    end

    def read_method_file path
      @method_file_content = read_file path
    end

    def read_template(temp_path)
      source = File.open(temp_path,"r").read
      template = ERB.new(source)
      result = template.result(binding)
      result
    end
  end
end