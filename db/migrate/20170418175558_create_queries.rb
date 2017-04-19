class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :search
      t.string :vibe
    end
  end
end
