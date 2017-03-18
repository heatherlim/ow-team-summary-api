

before do 
    response['Access-Control-Allow-Origin'] = 'http://localhost:3000'
end
CustomError = Class.new(StandardError)
get '/api/:battletag' do |battletag|
  content_type :json
  scraper = Scraper.new("#{battletag}")

  if scraper.error 
    redirect "/errors/#{battletag}"
  else  
    scraper.construct_json
  end
end

get '/errors/:battletag' do |battletag|
  raise CustomError, 'something'
end

error CustomError do
  'blah' + env['sinatra.error'].message
end