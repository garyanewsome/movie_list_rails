class Movie < ApplicationRecord
  require 'httparty'
  
  has_many :movie_lists_movies
  has_many :movie_lists, through: :movie_lists_movies
end
