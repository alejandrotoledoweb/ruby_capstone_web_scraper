#!/usr/bin/env ruby
require 'nokogiri'
require 'httparty'
require 'rubocop'
require 'byebug'

def scraper
  url = 'https://bento.io/tracks'
  unparsed_page = HTTParty.get(url) 
  parsed_page = Nokogiri::HTML(unparsed_page)
  track_listing = parsed_page.css('div.track-content')
  byebug
end

scraper

