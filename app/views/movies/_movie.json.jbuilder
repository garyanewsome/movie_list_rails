json.extract! movie, :id, :title, :year, :poster_url, :genre, :created_at, :updated_at
json.url movie_url(movie, format: :json)
