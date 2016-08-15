require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative "config/application.rb"

set :views, proc { File.join(root, "app/views") }
set :bind, '0.0.0'

get '/' do
  @posts  = Post.by_most_popular
  @post   = Post.new

  erb :posts # Do not remove this line
end

# Post creation
post '/posts' do
  @post        = Post.new
  @post.name   = params[:name]
  @post.url    = params[:url]
  @post.save

  if @post.save
    redirect to('/')
  else
    erb :new_post
  end
end

# Post upvote
put '/posts/:id/upvote' do
  post        = Post.find(params[:id])
  post.votes += 1
  post.save

  redirect to('/')
end
