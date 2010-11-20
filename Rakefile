# BUILD => bd
#
# Namespace for all tasks related to building the ActionScript Class files.
# Building from templates and add comments
#
# General project refactoring tasks are in rr

namespace "bd" do
  require 'builder/bin/build'
  
  desc "Add ASDoc comments to a Class and it's associated method Clases"
  task :comment_class, [:class_name] => [:comment_class_file, :comment_class_event, :comment_class_methods]

  desc "Add ASDoc comments to a Class definition"
  task :comment_class_file, [:class_name] do |t,args|
    b = Build.new args.class_name
    b.comment_class_file
  end

  desc "Add ASDoc comments to a Class Event definition"
  task :comment_class_event, [:class_name] do |t,args|
    b = Build.new args.class_name
    b.comment_class_event
  end

  desc "Add ASDoc comments to a Class Method definition"
  task :comment_class_method, [:class_name, :method_name] do |t, args|
    b = Build.new args.class_name,args.method_name
    b.comment_class_method
  end

  desc "Add ASDoc comments to all Methods of a particular Class"
  task :comment_class_methods, [:class_name] do |t,args|
    b = Build.new args.class_name
    b.comment_all_class_methods
  end
end

# REFACTORING => rr
#
# Namespace for all tasks related to general refactoring of the project.
#
# Specific ActionScript related tasks are in bd

namespace "rr" do
  desc "Find and Replace values across a project"
  task :find_and_replace, [:find_val, :replace_val] do |t,args|
    find = /#{args.find_val}/
    replace = args.replace_val
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

  desc "Find files with out a // Required comment"
  task :find_without_required do |t|
    Dir['src/api/**/*.as'].each do |file|
      f = File.open(file,"r")
      s = f.read
      
      unless s.match(/\/\/\s+[Rr]equired/)
        filename = File.split(file)[1]
        
        initial = filename.match(/./)[0]
        
        filename = filename.sub(initial,initial.downcase)
        method = filename.split(".")[0]
        if s.match(/public function #{method}\([\s*\w+]/)
          puts file
        end
      end
    end
  end
end