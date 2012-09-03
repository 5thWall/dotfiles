require 'rake'
require 'yaml'

@files = Dir.glob 'dots/*'

desc "Lists files this script will affect."
task :list do
  @files.each do |file|
    fname = file.split('/').last
    source = File.join ENV['PWD'], file
    target = File.join ENV['HOME'], ".#{fname}"

    if File.exists? target
      if File.identical? source, target
        puts "Identical: #{target}"
      else
        puts "Replace:   #{target}"
      end
    else
      puts "Link:       #{target}"
    end
  end
end

desc "Insall dotfiles to user home."
task :install do
  replace_all = false

  @files.each do |file|
    fname = file.split('/').last
    source = File.join ENV['PWD'], file
    target = File.join ENV['HOME'], ".#{fname}"

    if File.symlink? target
      puts "Linked:  #{target}"

    elsif File.exist? target
      if File.identical? source, target
        puts "Identical: #{target}"

      elsif replace_all
        replace_file file

      else
        print "Overwrite #{target}? [ynaq] "
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
          puts "Skipping:  #{target}"
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
    fname = file.split('/').last
    target = File.join ENV['HOME'], ".#{fname}"

    if File.exists?(target) || File.symlink?(target)
      replace_file file
    else
      link_file file
    end
  end
end

def replace_file file
  fname = file.split('/').last
  target = File.join ENV['HOME'], ".#{fname}"

  puts "Removing: #{target}"
  rm_rf target
  link_file file
end

def link_file file
  fname = file.split('/').last
  source = File.join ENV['PWD'], file
  target = File.join ENV['HOME'], ".#{fname}"

  if File.symlink? target
    puts "File #{target} already symlinked."
    return
  end

  puts "Linking:  #{target}"
  ln_sf source, target
end
