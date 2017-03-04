class Scraper
  attr_accessor :doc
  def initialize
    @doc = Nokogiri::HTML(open('https://playoverwatch.com/en-us/career/pc/us/happysquared-1920'))
  end
  
  def competitive_rank
    @doc.css('.competitive-rank .h6').children.first.text
  end
  
  
end