class Scraper
  attr_accessor :doc, :error
  
  def initialize(battletag)
    url = "https://playoverwatch.com/en-us/career/pc/us/#{battletag}"
    begin
      file = open(url)
      @doc = Nokogiri::HTML(file)
      rescue OpenURI::HTTPError => e
        if e.message == '404 Not Found'
          @error = 'Player not found'
        else
          raise e
        end
    end  
  end
  
  def construct_json
    { :player_name => self.player_name, 
      :competitive_rank => self.competitive_rank, 
      :top_three_heroes_played => self.top_three_heroes_played,
      :player_portrait => self.player_portrait}.to_json
  end
  
  def competitive_rank
    if @doc.css('.competitive-rank .h6').empty?
      ""
    else
      comp_rank = @doc.css('.competitive-rank .h6').children.first.text
      comp_rank.to_i
    end
  end
  
  def top_three_heroes_played
    hero_hash = {}
    for i in 0..2
      if @doc.css('#competitive .bar-text .description')[i].text != "--"
        hero_hash[@doc.css('#competitive .bar-text .title')[i].text] = @doc.css('#competitive .bar-text .description')[i].text
      end
    end
    hero_hash
    # {
    #   @doc.css('#competitive .bar-text .title')[0].text => @doc.css('#competitive .bar-text .description')[0].text,
    #   @doc.css('#competitive .bar-text .title')[1].text => @doc.css('#competitive .bar-text .description')[1].text,
    #   @doc.css('#competitive .bar-text .title')[2].text => @doc.css('#competitive .bar-text .description')[2].text
    # }
  end
  
  def player_name
    battletag = @doc.css('.header-masthead').text
  end
  
  def player_portrait
    portrait = @doc.css('.masthead .masthead-player .player-portrait').attr('src').value
  end
  
end
