require 'sinatra'
require 'imdb'

get '/' do
  erb :index 
end

post '/search' do
  @search_imdb = Imdb::Search.new(params[:title]).movies.first 
  erb :search
end

__END__
@@index
<html>
  <head>
  <title>IMDB</title>
  </head>
  <body>
    <h1>Search for Movies in IMDB database</h1>
    <form action="search" method="POST">
      <input type="text" name="title">
      <input type="submit" value="Search">
    </form>
  </body>
</html>

@@search
<table>

  
<tr>
  <td><img src="<%= @search_imdb.poster %>" width="200" height="200"></td>
  <td>
    <h2><a href="http://www.imdb.com/title/tt<%= @search_imdb.id %>"><%= @search_imdb.title %></a></h2>
    <h2><%= @search_imdb.rating %></h2>
  </td>
</tr>
</table>
<br/><br/>
<a href="/">Back</a>
