require 'trello'
require 'denv'
require 'pp'


def fetch_list_name(list)
  puts list.attributes[:name]
end

def main
  Denv.load
  Trello.configure do |config|
    config.consumer_key = ENV['TRELLO_CONSUMER_KEY']
    config.consumer_secret = ENV['TRELLO_CONSUMER_SECRET']
    config.oauth_token = ENV['TRELLO_OAUTH_TOKEN']
  end

  # card = Trello.client.find(:board, 'l9WkaZbY')
  # pp card.cards

  list = Trello.client.find(:list, '566cb8d16ce0bf9fa6d0d434')
  fetch_list_name(list)
end


main
