class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :year
      t.string :poster_url
      t.string :genre
      t.integer :rating

      t.timestamps
    end
  end
end
