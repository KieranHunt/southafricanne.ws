require 'sinatra'
require 'rest-client'

get '/' do
  page = File.read('index.html')
  data =
    RestClient
    .get('https://api.darksky.net/forecast/bfeb1c180a0c398b8700e5f02187175c/-33.92584,18.42322')
    .body

  page.gsub('data = "{{data}}"', "data = `#{data}`")
end
