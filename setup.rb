#!/usr/bin/env ruby

require 'denv'

DOTENV_FILE_NAME = '.env'.freeze
BITBAR_TRELLO_SIMLINK_NAME = 'bitbar_trello.rb'.freeze

def load_dotenv_file(dotenv_file)
  begin
  denv_file_path = if File.symlink?(__FILE__)
                     File.expand_path('..', File.realpath(__FILE__)) + "/#{dotenv_file}"
                   else
                     File.expand_path(File.dirname(__FILE__) + "/#{dotenv_file}")
                   end
  rescue
    raise "Plase create `.env` file."
  end
  Denv.load(denv_file_path)
end


def trello_symlink_exists?
  File.symlink?(ENV['BITBAR_PLUGIN_PATH'] + "/#{BITBAR_TRELLO_SIMLINK_NAME}")
end

def create_symlink
  unless trello_symlink_exists?
    File.symlink(__FILE__, ENV['BITBAR_PLUGIN_PATH'] + "/#{BITBAR_TRELLO_SIMLINK_NAME}")
    puts "Create program on bitbar plugin directory!"
    exit(0)
  end
end

load_dotenv_file(DOTENV_FILE_NAME)
create_symlink
