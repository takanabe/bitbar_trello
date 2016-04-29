#!/usr/bin/env ruby

require 'denv'
require File.expand_path(File.dirname(__FILE__)) + '/load_dotenv'

CURRENT_DIR_PATH = File.expand_path(File.dirname(__FILE__)) + '/'
DOTENV_FILE_NAME = '.env'.freeze
BITBAR_TRELLO_SIMLINK_NAME = 'bitbar_trello.rb'.freeze

def trello_symlink_exists?
  File.symlink?(ENV['BITBAR_PLUGIN_PATH'] + "/#{BITBAR_TRELLO_SIMLINK_NAME}")
end

def create_symlink
  unless trello_symlink_exists?
    if ENV['BITBAR_PLUGIN_PATH']
      File.symlink(CURRENT_DIR_PATH + BITBAR_TRELLO_SIMLINK_NAME, ENV['BITBAR_PLUGIN_PATH'] + "/#{BITBAR_TRELLO_SIMLINK_NAME}")
      puts "Create program on bitbar plugin directory!"
      exit(0)
    else
      puts "Please create `.env` file according to README.md"
    end
  else
    puts "There is symlink already..."
  end
end

load_dotenv_file(DOTENV_FILE_NAME)
create_symlink
