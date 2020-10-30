#!/usr/bin/env ruby
require_relative '../lib/scraper'
require_relative '../lib/setup'

require 'nokogiri'
require 'httparty'
require 'rubocop'

init = FirstSetup.new
scraper_web = ScraperClass.new('https://bento.io/tracks')

puts init.first_message

continue = true

while continue
  puts init.first_instructions
  puts 'Do you want to see the tracks available: type "y" or type any other key to end the app'
  user_choice = gets.chomp.upcase
  if user_choice == 'Y'
    scraper_web.scraper
  else
    puts 'Thank you, End of the scraper app'
  end
  continue = false
end
