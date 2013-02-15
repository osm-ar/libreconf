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

ActiveRecord::Schema.define(:version => 20130215222616) do

  create_table "abstract_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "abstracts", :force => true do |t|
    t.string   "author"
    t.string   "email"
    t.string   "title"
    t.text     "description"
    t.integer  "abstract_status_id", :default => 1
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "organization"
    t.boolean  "is_key",             :default => false
    t.string   "country"
  end

  create_table "speaker_translations", :force => true do |t|
    t.integer  "speaker_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "speaker_translations", ["locale"], :name => "index_speaker_translations_on_locale"
  add_index "speaker_translations", ["speaker_id"], :name => "index_speaker_translations_on_speaker_id"

  create_table "speakers", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.string   "picture_url"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "organization"
    t.string   "country"
  end

  create_table "sponsor_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sponsor_type_id"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "logo_url"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "workshops", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "description"
    t.integer  "capacity"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
