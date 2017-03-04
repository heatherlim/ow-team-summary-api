class Scraper
  attr_accessor :doc
  def initialize
    @doc = Nokogiri::HTML(open('https://playoverwatch.com/en-us/career/pc/us/#{bnettaghere}'))
  end
  
  def competitive_rank
    @doc.css('.competitive-rank .h6').children.first.text
  end
  
  def top_three_heroes
    first_hero = @doc.css('#competitive .bar-text .title')[0].text
    first_hero_time = @doc.css('#competitive .bar-text .description')[0].text
    
    second_hero = @doc.css('#competitive .bar-text .title')[1].text
    second_hero_time = @doc.css('#competitive .bar-text .description')[1].text
    
    third_hero = @doc.css('#competitive .bar-text .title')[2].text
    third_hero_time = @doc.css('#competitive .bar-text .description')[2].text
  end
  
end