before do 
    response['Access-Control-Allow-Origin'] = 'http://localhost:3000'
end

get '/api/:battletag' do |battletag|
  content_type :json
  scraper = Scraper.new("#{battletag}")

  if scraper.error 
    redirect "/errors"
  else  
    scraper.construct_json
  end
end

error 404 do
  "Player not found"
end

get '/errors' do 
  404
end

