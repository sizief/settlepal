require 'sinatra'
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'

posts = {}
Dir["./data/*"].each do |f|
  file = File.open(f)
  file_data = file.read
  post = {}
  data = file_data.split("---")
  post[:body] = data.last
  data.first.split("\n").each do |data|
    post[data.split(":").first.to_sym] = data.split(":").last
  end
  posts[post[:url].to_s] = post
end

get '/' do
  erb :index, :locals => {posts: posts}
end

get '/:url' do |url|
  erb :page, :locals => {text: markdown(posts[url][:body]), post: posts[url]}
end
