class AddScoreAndTimestampToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :score, :float
    add_timestamps :searches, null: true
  end
end
