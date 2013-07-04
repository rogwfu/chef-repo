# encoding: utf-8

require 'bundler'
require 'bundler/setup'
require 'berkshelf/thor'

class Packer < Thor
# FIXME: https://github.com/erikhuda/thor/blob/master/Thorfile
#  include Thor::RakeCompat
#  Bundler::GemHelper.install_tasks

    desc "build", "Build with packer"
    def build 
      puts "Hey" 
    end

    desc "convert", "Convert a veewee template to a packer one"
    method_option :machine, :type => :string, :required => true
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
    method_option :machine, :type => :string, :required => true
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


    desc "validate", "Validate a packer config"
    def validate 
      puts "Hey" 
    end
end
