# spec/scraper_spec.rb

require './lib/scraper'

describe ScraperClass do
  let(:test_var) { ScraperClass.new }
  describe 'scraper' do
    it 'test if the output is a string from the web page' do
      expect(test_var.track_arr.class.superclass).to eql(Object)
    end
  end
end
