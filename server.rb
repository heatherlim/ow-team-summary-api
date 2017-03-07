get '/api/:battletag' do |battletag|
  content_type :json
  scraper = Scraper.new("#{battletag}")
  response['Access-Control-Allow-Origin'] = 'http://localhost:3000'
  scraper.construct_json
end