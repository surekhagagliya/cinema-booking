class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :per_votes
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
