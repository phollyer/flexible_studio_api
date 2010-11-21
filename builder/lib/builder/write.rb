module Builder
  module Write

    def write_file path,contents
      puts "Writing:\t#{path}"
      
      file = File.new path,"w"
      
      if file.write(contents)
        puts "OK"
      else
        puts "Error writing:\t#{path}"
        exit
      end

      true
    end
    
  end
end