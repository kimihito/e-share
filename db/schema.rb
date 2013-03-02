# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130302021035) do

  create_table "favorite_videos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "xvideo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favorite_videos", ["xvideo_id", "user_id"], :name => "index_favorite_videos_on_xvideo_id_and_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "token"
  end

  create_table "watch_histories", :force => true do |t|
    t.integer  "user_id"
    t.integer  "xvideo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "watch_histories", ["xvideo_id", "user_id"], :name => "index_watch_histories_on_xvideo_id_and_user_id"

  create_table "xvideos", :force => true do |t|
    t.string   "title"
    t.text     "url"
    t.text     "thumb_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "xvideos", ["url"], :name => "index_xvideos_on_url", :unique => true

end
