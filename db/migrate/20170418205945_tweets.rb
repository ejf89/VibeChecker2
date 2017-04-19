class Tweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :user_name
      t.string :content
      t.string :location
      t.string :date
      t.integer :query_id
    end
  end
end
