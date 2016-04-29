require 'trello'
require 'denv'
require 'pp'

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
  Denv.load
  Trello.configure do |config|
    config.consumer_key = ENV['TRELLO_CONSUMER_KEY']
    config.consumer_secret = ENV['TRELLO_CONSUMER_SECRET']
    config.oauth_token = ENV['TRELLO_OAUTH_TOKEN']
  end

  list = Trello.client.find(:list, ENV['LIST_ID'])
  puts fetch_list_name(list)
  cards = fetch_cards_from_list(list)

  cards.each do |card|
    puts extract_card_name(card)
  end
end


main
