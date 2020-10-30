# spec/scraper_spec.rb

require './lib/scraper'

describe ScraperClass do
  let(:test_var) { ScraperClass.new('https://bento.io/tracks') }
  let(:test_output) { 'test_var.print_data' }
  describe '#scraper' do
    it 'test if the output is an object' do
      expect(test_var.track_arr.class.superclass).to eql(Object)
    end
  end

  describe '#print_data' do
    it 'test the output class of the method' do
      expect(test_output.class).to eq(String)
    end
  end
end
