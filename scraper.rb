require 'pry'
require 'nokogiri'
require 'open-uri'
class Scraper
  attr_accessor :doc
  
  def initialize
    @doc = Nokogiri::HTML(open('https://playoverwatch.com/en-us/career/pc/us/happysquared-1920'))
  end
  
  def competitive_rank
    @doc.css('.competitive-rank .h6').children.first.text
  end
  
  def top_three_heroes_played
    {
      @doc.css('#competitive .bar-text .title')[0].text => @doc.css('#competitive .bar-text .description')[0].text,
      @doc.css('#competitive .bar-text .title')[1].text => @doc.css('#competitive .bar-text .description')[1].text,
      @doc.css('#competitive .bar-text .title')[2].text => @doc.css('#competitive .bar-text .description')[2].text
    }
  end
  
  def player_name
    battletag = @doc.css('.header-masthead').text
  end
  
  def player_portrait
    portrait = @doc.css('.masthead .masthead-player .player-portrait').attr('src').value
  end
  
end
