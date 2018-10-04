class MovieListsMovie < ApplicationRecord
  belongs_to :movie_list
  belongs_to :movie
end
