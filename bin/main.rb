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
    scraper_web.scraper_tracks
    scraper_web.print_data
  else
    puts 'Thank you, End of the scraper app'
  end
  continue = false
end

next_data = true

while next_data
  puts 'For see more description of:'
  puts "\n"
  puts 'WEB track, type 1'
  puts "\n"
  puts 'HTML track, type 2'
  user_next = gets.chomp

  case user_next.to_i

  when 1
    scraper_web.scrap_web
  when 2
    scraper_web.scrap_html
  end
  next_data = false
end
