# encoding: utf-8

require 'bundler'
require 'bundler/setup'
require 'berkshelf/thor'

class Packer < Thor
# FIXME: https://github.com/erikhuda/thor/blob/master/Thorfile
#  include Thor::RakeCompat
#  Bundler::GemHelper.install_tasks
   include Thor::Actions

     def self.source_root
         File.dirname(__FILE__) + "/packer/templates"
    end

    # http://www.packer.io/docs/command-line/build.html
    desc "build", "Build with packer"
    method_option :debug, :desc => "Disables parallelization and enables debug mode.", :type => :boolean, :default => false
    method_option :except, :desc => " Builds all the builds except those with the given comma-separated names.", :type => :string
    method_option :only, :desc => "Only build the builds with the given comma-separated names.", :type => :string
    method_option :template, :desc => "The template file to build.", :type => :string, :required => true
    method_option :username, :desc => "Username to use for the machine", :type => :string, :default => "user"
    method_option :password, :desc => "Password to use for the machine", :type => :string, :default => "password"
    def build 
      # Replace usernames and passwords
      subs = find_subs([ "#{source_paths[0]}/#{options[:template]}", "#{source_paths[0]}/#{options[:template]}/scripts"])
      sub_variables(subs, {"%%USERNAME%%" => options[:username], "%%PASSWORD%%" => options[:password]})
      run("cd packer/templates/#{options[:template]} ; packer build template.json") 
      restore_files(subs)
    end

    desc "convert", "Convert a veewee template to a packer one"
    method_option :machine, :desc => "The name of the veewee template to convert.", :type => :string, :required => true
    def convert 
      exec "veewee-to-packer packer/templates/#{options[:machine]}/defintion.rb -o packer/output" 
      # Move packer/output/template.json to packer/correct-name.json 
      # Move packer/output/http/preseed.cfg to packer/preseeds/correct-name.json
      # Move packer/output/scripts/* to packer/scripts/*
      # Alter packer/correct-name.json's preseed file to use the new one
      # Alter packer/correct-name.json's scripts to use the new ones
      # Remove packer/output directory
      # Call validation?
    end

    desc "find", "Search for packer templates"
    method_option :machine, :desc => "A search term to find in the list of packer templates.", :type => :string, :required => true
    def find
      veeweeTemplates = Dir.glob("packer/templates/*#{options[:machine]}*")
      veeweeTemplates.each do |template|
        say template.split("/")[-1], :green
      end
    end

    desc "list", "List all of the possible packer templates to convert"
    def list 
      veeweeTemplates = Dir.glob("packer/templates/*")
      # FIXME: Should be more elegant than this, quick fix
      veeweeTemplates.each do |template|
        say template.split("/")[-1], :green
      end
    end

    # http://www.packer.io/docs/command-line/validate.html
    desc "validate", "Validate a packer config"
    method_option :syntax, :desc => "Only the syntax of the template is checked. The configuration is not validated.", :type => :boolean, :default => false
    method_option :template, :desc => "The template file validate.", :type => :string, :required => true
    def validate 
      puts "Hey" 
    end

    no_tasks do

      # FIXME: Add comments
      def find_subs(directories)
      script_subs = []
        directories.each do |directory| 
          Dir.foreach(directory) do |file|
            next if file == '.' or file == '..' or File.directory?("#{directory}/#{file}")
              if File.readlines("#{directory}/#{file}").grep(/%%/).any?
                script_subs << "#{directory}/#{file}"
              end
          end
        end

        return(script_subs)
      end

      # FIXME: Add comments
      def sub_variables(files, subs) 
#       FIXME: Add error checks for file existence
       files.each do |filename|
          copy_file(filename, "#{filename}.bk", {:verbose => false}) 
          subs.each do |key, value|
            gsub_file(filename, key, value)
          end
       end
      end

      # FIXME: Add comments
      def restore_files(subs)
        subs.each do |filename|
          copy_file("#{filename}.bk", filename, {:force => true, :verbose => false})
          remove_file("#{filename}.bk", {:verbose => false})
        end
      end
    end
end
