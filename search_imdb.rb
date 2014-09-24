require 'sinatra'
require 'sinatra/reloader'
require 'imdb'

movies = []
get '/' do
  @result = movies
  erb :index 
end

post '/search' do
  @search_imdb = Imdb::Search.new(params[:title]).movies.first 
  movies << @search_imdb
 
  if movies
    redirect to('/')
  else
    "no movie found"
  end
end

