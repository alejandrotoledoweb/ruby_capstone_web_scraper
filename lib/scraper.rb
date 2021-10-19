# this is the main class for app
class ScraperClass
  attr_reader :track_listing, :overview
  attr_accessor :url, :parsed_page, :unparsed_page, :track_arr

  def initialize(url)
    @url = url
  end

  def scraper
    @unparsed_page = HTTParty.get(@url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
    @track_listing = @parsed_page.css('a.track') # 20 tracks
    @track_listing
  end

  def scraper_tracks
    @track_arr = []
    @track_listing.each do |track_item|
      @tracks = {
        title: track_item.css('div.track-content')[0].children.children[0].text,
        description: track_item.css('div.track-content')[0].children.children[1].text,
        url: "https://bento.io#{track_item['href']}"
      }
      @track_arr << @tracks
    end
    @track_arr
  end

  def print_data
    @track_arr.each_with_index do |item, idx|
      puts "\n"
      puts "Track No. #{idx+1}"
      puts item[:title]
      puts item[:description]
      puts item[:url]
      puts "\n"
    end
  end

  def scrap_web
    url_web = 'https://bento.io/topic/web'
    unparsed_page_web = HTTParty.get(url_web)
    parsed_page_web = Nokogiri::HTML(unparsed_page_web)
    @track_listing_web = parsed_page_web.css('div.track-body') # 1 description
    @overview = @track_listing_web[0].children[1].text
    puts @overview
  end

  def scrap_html
    url_html = 'https://bento.io/topic/html'
    unparsed_page_html = HTTParty.get(url_html)
    parsed_page_html = Nokogiri::HTML(unparsed_page_html)
    @track_listing_html = parsed_page_html.css('div.track-body') # 1 description
    @overview_html = @track_listing_html[0].children[1].text
    puts @overview_html
  end

  private

  def complete_page
    parsed_page(@url)
  end

  def categories
    @tracks_all = []
    fetch_title.each do |cat|
      cat_node = cat.css('div.track-content')[0].children.children[0].text
      cat_node.each do |node|
        @tracks_all << node.css('div.track-content')[0].children.children[0].text
      end
    end
    @tracks_all
  end

  def fetch_title
    complete_page.css('a.track')
  end
end
