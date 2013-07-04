# encoding: utf-8

require 'bundler'
require 'bundler/setup'
require 'berkshelf/thor'

class Packer < Thor
# FIXME: https://github.com/erikhuda/thor/blob/master/Thorfile
#  include Thor::RakeCompat
#  Bundler::GemHelper.install_tasks

    # http://www.packer.io/docs/command-line/build.html
    desc "build", "Build with packer"
    method_option :debug, :desc => "Disables parallelization and enables debug mode.", :type => :boolean, :default => false
    method_option :except, :desc => " Builds all the builds except those with the given comma-separated names.", :type => :string
    method_option :only, :desc => "Only build the builds with the given comma-separated names.", :type => :string
    method_option :template, :desc => "The template file to build.", :type => :string, :required => true
    def build 
      puts "Hey" 
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

    desc "find", "Search for a veewee template"
    method_option :machine, :desc => "A search term to find in the list of veewee templates.", :type => :string, :required => true
    def find
      veeweeTemplates = Dir.glob("packer/templates/*#{options[:machine]}*")
      veeweeTemplates.each do |template|
        say template.split("/")[-1], :green
      end
    end

    desc "list", "List all of the possible Veewee templates to convert"
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
end
