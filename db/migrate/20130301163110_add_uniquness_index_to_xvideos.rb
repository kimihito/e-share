class AddUniqunessIndexToXvideos < ActiveRecord::Migration
  def change
    add_index :xvideos, :url, unique: true, length: {url:255}
  end
end
