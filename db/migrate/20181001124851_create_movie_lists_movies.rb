class CreateMovieListsMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_lists_movies do |t|
      t.integer :movie_list_id, null: false
      t.integer :movie_id, null: false

      t.timestamps null: false
    end
  end
end
