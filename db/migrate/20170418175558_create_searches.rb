class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :search
      t.string :vibe
    end
  end
end
