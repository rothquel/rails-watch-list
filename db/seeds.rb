require "json"
require "open-uri"

Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
movies_array = movies["results"]

movies_array.each do |movie|
  title = movie["title"]
  overview = movie["overview"]
  rating = movie["vote_average"]
  poster = "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
  new_movie = Movie.new(title: title, overview: overview, rating: rating, poster_url: poster)
  new_movie.save!
  puts "added #{movie["title"]}"
end
