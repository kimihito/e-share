class AddUniqunessIndexToXvideos < ActiveRecord::Migration
  def change
    add_index :xvideos, :url, unique: true
  end
end
