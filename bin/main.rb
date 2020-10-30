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
  puts 'If you want to see a description of the first track type "Y" again'
  user_next = gets.chomp.upcase
  if user_next == 'Y'
    puts scraper_web.scrape_more('https://bento.io/topic/web')
  else 
    puts 'Thank you, End of the Scraper App'
  end
  puts "\n"
  puts 'Thank you, End of the Scraper App'
  next_data = false
end


