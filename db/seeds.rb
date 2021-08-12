require 'open-uri'
require 'json'

puts "Cleaning de database..."
Movie.destroy_all

puts "Adding movies..."
# Parsing
movies = JSON.parse(URI.open('http://tmdb.lewagon.com/movie/top_rated').read)
my_movies = movies['results'].first(10)

my_movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
puts "10 movies added!"