desc "Find and Replace values across a project"
task :find_and_replace, [:find, :replace] do |t,args|
     find = args.find
     replace = args.replace
     files = Dir['src/api/**/*.as']
     files.each do |file|
        f = File.open(file, "r")
        s = f.read
        if s.match(find)
          s.gsub!(find, replace)
          dir = File.split(file)[0]
          filename = File.split(file)[1]
          filename.gsub!(find, replace)
          file = File.join dir, filename
          puts "Updating #{file}"
          new_file = File.new(file, "w")
          new_file.write(s)
        end
     end
end