class CreateXvideos < ActiveRecord::Migration
  def change
    create_table :xvideos do |t|
      t.string :title
      t.text :url
      t.text :thumb_url

      t.timestamps
    end
  end
end
