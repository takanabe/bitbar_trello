#!/usr/bin/env ruby

require 'trello'
require File.expand_path(File.dirname(File.realpath(__FILE__))) + '/load_dotenv'

DOTENV_FILE_NAME = '.env'.freeze
BITBAR_TRELLO_SIMLINK_NAME = 'bitbar_trello.rb'.freeze

def set_trello_config
  Trello.configure do |config|
    config.consumer_key = ENV['TRELLO_CONSUMER_KEY']
    config.consumer_secret = ENV['TRELLO_CONSUMER_SECRET']
    config.oauth_token = ENV['TRELLO_OAUTH_TOKEN']
  end
end

load_dotenv_file(DOTENV_FILE_NAME)
set_trello_config
card_id = ARGV[0]

if ARGV[1] == 'ToDo'
  Trello.client.put("/cards/#{card_id}/idList",
                  { value: ENV['DOING_LIST_ID']})
elsif ARGV[1] == 'Doing'
  Trello.client.put("/cards/#{card_id}/idList",
                  { value: ENV['DONE_LIST_ID']})
else
  raise "not match"
end
