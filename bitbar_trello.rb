#!/usr/bin/env ruby

require 'trello'
require 'denv'
require 'pp'


def load_dotenv_file(dotenv_file)
  denv_file_path = if File.symlink?(__FILE__)
                     File.expand_path('..', File.realpath(__FILE__)) + "/#{dotenv_file}"
                   else
                     raise "Pleae execute setup script"
                   end
  Denv.load(denv_file_path)
end

def set_trello_config
  Trello.configure do |config|
    config.consumer_key = ENV['TRELLO_CONSUMER_KEY']
    config.consumer_secret = ENV['TRELLO_CONSUMER_SECRET']
    config.oauth_token = ENV['TRELLO_OAUTH_TOKEN']
  end
end

def fetch_doing_lists
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
  dotenv_filename= '.env'
  load_dotenv_file(dotenv_filename)
  set_trello_config

  list = Trello.client.find(:list, ENV['LIST_ID'])
  puts 'List: ' + fetch_list_name(list)
  cards = fetch_cards_from_list(list)

  cards.each do |card|
    puts 'Card: ' +  extract_card_name(card)
  end
end

main
