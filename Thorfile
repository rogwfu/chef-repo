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
    def convert 
      exec "veewee-to-packer packer/templates/#{choice}/defintion.rb -o packer/output" 
      # Move packer/output/template.json to packer/correct-name.json 
      # Move packer/output/http/preseed.cfg to packer/preseeds/correct-name.json
      # Move packer/output/scripts/* to packer/scripts/*
      # Alter packer/correct-name.json's preseed file to use the new one
      # Alter packer/correct-name.json's scripts to use the new ones
      # Remove packer/output directory
      # Call validation?
    end

    desc "validate", "Validate a packer config"
    def validate 
      puts "Hey" 
    end
end
