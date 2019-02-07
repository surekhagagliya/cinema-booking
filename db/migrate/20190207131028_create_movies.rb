class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :movie_type
      t.integer :votes
      t.integer :rates
      t.text :summary
      t.text :static_review
      t.string :trailer
      t.integer :screen_number
      t.date :release_date
      t.date :end_date
      t.time :time
      t.belongs_to :manager, foreign_key: true

      t.timestamps
    end
  end
end
