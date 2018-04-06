require 'sinatra'
require 'rest-client'

get '/' do
  page = File.read('index.html')
  data =
    RestClient
    .get('https://news.google.com/news/rss/?ned=en_za&gl=ZA&hl=en')
    .body

  page.gsub('feedData = "{{feedData}}"', " feedData = `#{data}`")
end
