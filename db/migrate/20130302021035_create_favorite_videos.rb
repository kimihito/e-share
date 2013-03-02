class CreateFavoriteVideos < ActiveRecord::Migration
  def change
    create_table :favorite_videos do |t|
      t.references :user
      t.references :xvideo

      t.timestamps
    end
    add_index :favorite_videos, [:xvideo_id, :user_id], unique: true
  end
end
