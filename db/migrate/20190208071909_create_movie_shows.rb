class CreateMovieShows < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_shows do |t|
      t.date :date
      t.time :time
      t.references :screen, foreign_key: true

      t.timestamps
    end
  end
end
