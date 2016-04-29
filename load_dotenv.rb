#!/usr/bin/env ruby

require 'denv'

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


