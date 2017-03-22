require 'sinatra.rb'

get '/' do
  'Creating apis'
end


get '/film.json' do
  'loading json'
end

get '/film.xml' do
  'loading xml'
end

get '/film.html' do
  'loading html'
end