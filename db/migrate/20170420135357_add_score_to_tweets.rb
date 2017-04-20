class AddScoreToTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :score, :float
  end
end
