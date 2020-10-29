#!/usr/bin/env ruby
require 'nokogiri'
require 'httparty'
require 'rubocop'
require 'byebug'

def scraper
  url = 'https://bento.io/tracks'
  unparsed_page = HTTParty.get(url) 
  parsed_page = Nokogiri::HTML(unparsed_page)
  track_listing = parsed_page.css('a.track') # 20 tracks
  track_listing.each do |track_listing|
    tracks = {
      title: track_listing.css('div.track-content')[0].children.children[0].text,
      description:  track_listing.css('div.track-content')[0].children.children[1].text,
      url: 'https://bento.io' + track_listing["href"],
    } 
  end
  byebug
end

scraper
