class CreateWatchHistories < ActiveRecord::Migration
  def change
    create_table :watch_histories do |t|
      t.references :user
      t.references :xvideo

      t.timestamps
    end
    add_index :watch_histories, [:xvideo_id, :user_id]
  end
end
