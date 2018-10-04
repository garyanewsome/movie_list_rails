class CreateMovieLists < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_lists do |t|
      t.string :title, null: false
      t.string :description

      t.timestamps
    end
  end
end
