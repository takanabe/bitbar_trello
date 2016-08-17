#!/usr/bin/env ruby

require 'trello'
require File.expand_path(File.dirname(File.realpath(__FILE__))) + '/load_dotenv'
require 'pp'

DOTENV_FILE_NAME = '.env'.freeze
BITBAR_TRELLO_SIMLINK_NAME = 'bitbar_trello.rb'.freeze
MAX_NUMBER_OF_TODOS = 10.freeze

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

def extract_card_url(card)
  card.attributes[:short_url]
end

def extract_card_id(card)
  card.attributes[:id]
end

def hide_stdout_into_menu_bar_from_here
  puts "---"
end

def alart_to_reduce_todos
  puts "Reduce your todos!! | color=red"
end

def exceed_card_limit?(cards)
  if cards.length < MAX_NUMBER_OF_TODOS
    false
  else
    true
  end
end

def move_to_another_list(current_list_name,card)
  if current_list_name == 'ToDo'
    puts "- Move to Doing | bash=ruby param1=#{File.expand_path(File.dirname(File.realpath(__FILE__))) + '/move_card_to_another_list.rb'} param2=#{extract_card_id(card)} param3=#{current_list_name}"
  elsif current_list_name == 'Doing'
    puts "- Move to Done | bash=ruby param1=#{File.expand_path(File.dirname(File.realpath(__FILE__))) + '/move_card_to_another_list.rb'} param2=#{extract_card_id(card)} param3=#{current_list_name}"
  end
end

def display_cards(list_id)
  set_trello_config

  list = Trello.client.find(:list, list_id)
  current_list_name = fetch_list_name(list)
  puts "Trello list: #{current_list_name} | color=#00ffff"
  cards = fetch_cards_from_list(list)

  hide_stdout_into_menu_bar_from_here
  yield cards if block_given?
  cards.each do |card|
    puts "Card: #{extract_card_name(card)} |  href=#{extract_card_url(card)}"
    if current_list_name == 'ToDo' || current_list_name == 'Doing'
      move_to_another_list(current_list_name, card)
    end
  end
end

load_dotenv_file(DOTENV_FILE_NAME)
display_cards(ENV['TODO_LIST_ID']) do |cards|
  alart_to_reduce_todos if exceed_card_limit?(cards)
end
display_cards(ENV['DOING_LIST_ID'])
display_cards(ENV['DONE_LIST_ID'])
