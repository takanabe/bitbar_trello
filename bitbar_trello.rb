#!/usr/bin/env ruby

require 'trello'
require File.expand_path(File.dirname(File.realpath(__FILE__))) + '/load_dotenv'
require 'pp'

DOTENV_FILE_NAME = '.env'.freeze
BITBAR_TRELLO_SIMLINK_NAME = 'bitbar_trello.rb'.freeze

def set_trello_config
  Trello.configure do |config|
    config.consumer_key = ENV['TRELLO_CONSUMER_KEY']
    config.consumer_secret = ENV['TRELLO_CONSUMER_SECRET']
    config.oauth_token = ENV['TRELLO_OAUTH_TOKEN']
  end
end

def fetch_list_name(list)
  list.attributes[:name]
end

def fetch_cards_from_list(list)
  list.cards
end


def extract_card_name(card)
  card.attributes[:name]
end

def main
  set_trello_config

  list = Trello.client.find(:list, ENV['LIST_ID'])
  binding.pry
  puts "List: #{fetch_list_name(list)} | color=#00ffff"
  cards = fetch_cards_from_list(list)

  hide_content_into_menu_bar_from_here
  cards.each do |card|
    puts "Card: #{extract_card_name(card)} | color=#ffffff"
  end
end

load_dotenv_file(DOTENV_FILE_NAME)
main
