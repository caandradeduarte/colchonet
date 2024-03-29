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

ActiveRecord::Schema.define(:version => 20121220023224) do

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "points"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reviews", ["room_id", "user_id"], :name => "index_reviews_on_room_id_and_user_id", :unique => true
  add_index "reviews", ["room_id"], :name => "index_reviews_on_room_id"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "rooms", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
    t.integer  "reviews_count"
    t.string   "slug"
    t.string   "picture"
  end

  add_index "rooms", ["slug"], :name => "index_rooms_on_slug", :unique => true
  add_index "rooms", ["user_id"], :name => "index_rooms_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "location"
    t.text     "bio"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
