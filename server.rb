get '/api/:battletag' do |battletag|
  content_type :json
  scraper = Scraper.new("#{battletag}")
  { :player_name => scraper.player_name, 
    :competitive_rank => scraper.competitive_rank, 
    :top_three_heroes_played => scraper.top_three_heroes_played,
    :player_portrait => scraper.player_portrait}.to_json
end