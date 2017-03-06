get '/api/:battletag' do |battletag|
  content_type :json
  scraper = Scraper.new("#{battletag}")
  scraper.construct_json
end