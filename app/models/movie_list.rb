class MovieList < ApplicationRecord
    has_many :movie_lists_movies
  has_many :movies, through: :movie_lists_movies
end
