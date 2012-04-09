require 'rake'
require 'yaml'

@files = YAML.load_file "dotfiles.yaml"

desc "Lists files this script will affect."
task :list do
  @files.each do |file|
    if File.exists? File.join(ENV['HOME'], ".#{file}")
      if File.identical? "dots/#{file}", File.join(ENV['HOME'], ".#{file}")
        puts "Identical: ~/.#{file}"
      else
        puts "Replace:   ~/.#{file}"
      end
    else
      puts "Link:       ~/.#{file}"
    end
  end
end

desc "Insall dotfiles to user home."
task :install do
  replace_all = false
  
  @files.each do |file|
    file_home = File.join ENV['HOME'], ".#{file}"
    
    if File.symlink? file_home
      puts "Linked:   ~/.#{file}"
      
    elsif File.exist? File.join(ENV['HOME'], ".#{file}")
      if File.identical? "dots/#{file}", File.join(ENV['HOME'], ".#{file}")
        puts "Identical: ~/.#{file}"
        
      elsif replace_all
        replace_file file
      
      else
        print "Overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a', 'A'
          replace_all = true
          replace_file file
        when 'y', 'Y'
          replace_file file
        when 'q', 'Q'
          puts "Exiting"
          exit
        else
          puts "Skipping: ~/#{file}"
        end
      end
      
    else
      link_file file
    end
  end
end

desc "Overwrite all files!"
task :overwrite do
  @files.each do |file|
    file_home = File.join ENV['HOME'], ".#{file}"
    
    if File.exists?(file_home) || File.symlink?(file_home)
      replace_file file
    else
      link_file file
    end
  end
end

def replace_file file
  puts "Removing: ~/.#{file}"
  File.delete File.join(ENV['HOME'], ".#{file}")
  link_file file
end

def link_file file
  if File.symlink? File.join(ENV['HOME'], ".#{file}")
    puts "File ~/.#{file} already symlinked."
    return
  end
  
  puts "Linking:  ~/.#{file}"
  File.symlink File.join(ENV['PWD'], "dots/#{file}"), File.join(ENV['HOME'], ".#{file}")
end