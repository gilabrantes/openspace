# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080701222008) do

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "answer",        :limit => 11
    t.integer  "user_id",       :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discussion_id", :limit => 11
  end

  create_table "discussions", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "kind",       :limit => 11
    t.integer  "status",     :limit => 11
    t.integer  "answered",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    :limit => 11
    t.integer  "space_id",   :limit => 11
  end

  create_table "spaces", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer  "points",                    :limit => 11, :default => 0
    t.string   "nickname"
  end

end
