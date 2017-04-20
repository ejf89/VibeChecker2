class AddCountsSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :count, :integer
  end
end
