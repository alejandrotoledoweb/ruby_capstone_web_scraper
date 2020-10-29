#!/usr/bin/env ruby
require 'nokogiri'
require 'httparty'
require 'rubocop'
require 'byebug'

class Scraper
  def scraper
    attr_reader :track_arr, :number_user
  
    @number_user = gets.chomp
    if @number_input.include?(1..20)
      url = 'https://bento.io/tracks'
      unparsed_page = HTTParty.get(url) 
      parsed_page = Nokogiri::HTML(unparsed_page)
      track_arr = []
      track_listing = parsed_page.css('a.track') # 20 tracks
      track_listing.each do |track_listing|
        tracks = {
          title: track_listing.css('div.track-content')[0].children.children[0].text,
          description: track_listing.css('div.track-content')[0].children.children[1].text,
          url: "https://bento.io#{track_listing['href']}"
        }
        track_arr << tracks
      end
    else
      'please enter a valid number'
    end
  end
  track_arr[@number_input][:title]
  track_arr[@number_input][:description]
  track_arr[@number_input][:url]
end

class FirstSetup

  def first_message
    'this is the scraper app for Bento.io web page'
  end

  def first_instructions
    'We have 20 tracks to follow, please type a number between 1 ~ 20 to se tracks'
  end

end


init = FirstSetup.new

puts init.first_message

continue = true

while continue
puts init.first_instructions
