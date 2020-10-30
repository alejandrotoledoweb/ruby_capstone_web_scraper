class ScraperClass
  attr_reader :track_arr

  def scraper
    url = 'https://bento.io/tracks'
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    track_arr = []
    track_listing = parsed_page.css('a.track') # 20 tracks
    track_listing.each do |track_item|
      tracks = {
        title: track_item.css('div.track-content')[0].children.children[0].text,
        description: track_item.css('div.track-content')[0].children.children[1].text,
        url: "https://bento.io#{track_item['href']}"
      }
      track_arr << tracks
    end
    track_arr.each do |item|
      puts item[:title]
      puts item[:description]
      puts item[:url]
      puts "\n"
    end
  end
end
