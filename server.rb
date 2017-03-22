require 'sinatra'
require 'json'
require 'csv'

csv_arr_of_arrs = CSV.read("./Film.csv", headers: true)

# tried to implement my own random index picker
# def sample
#   (rand*100).round - 1
# end


get '/' do  
  "Head over to /film.json or /film.html or /film.xml"
end


get '/film.json' do
  content_type "application/json"
  sample_arr = csv_arr_of_arrs.to_a.sample
  # title -> sample_arr[1]  year -> sample_arr[2]
  {title: sample_arr[1].tr('_', ' '), year: sample_arr[2]}.to_json
end

get '/film.xml' do
  content_type 'text/xml'
  sample_arr = csv_arr_of_arrs.to_a.sample
  film = {title: sample_arr[1].tr('_', ' '), year: sample_arr[2]}
  "<?xml version=\"1.0\" encoding=\"UTF-8\"?><data><title>#{film[:title]}</title><year>#{film[:year]}</year></data>"
end

get '/film.html' do
  sample_arr = csv_arr_of_arrs.to_a.sample
  @film = {title: sample_arr[1].tr('_', ' '), year: sample_arr[2]}
  erb :film
end
