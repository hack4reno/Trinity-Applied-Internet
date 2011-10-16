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

ActiveRecord::Schema.define(:version => 20111016045321) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "age_ratings", :id => false, :force => true do |t|
    t.string   "uuid",       :limit => 36, :null => false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorizations", :id => false, :force => true do |t|
    t.string   "uuid",         :limit => 36,                    :null => false
    t.string   "user_id",      :limit => 36,                    :null => false
    t.string   "service_name"
    t.string   "service_id"
    t.string   "service_url"
    t.string   "type"
    t.string   "app_id"
    t.string   "app_secret"
    t.string   "key"
    t.string   "secret"
    t.boolean  "deleted",                    :default => false, :null => false
    t.boolean  "active",                     :default => true,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :id => false, :force => true do |t|
    t.string   "uuid",        :limit => 36, :null => false
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "event_categories", :id => false, :force => true do |t|
    t.string   "uuid",        :limit => 36, :null => false
    t.string   "event_id",    :limit => 36, :null => false
    t.string   "category_id", :limit => 36, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_ratings", :force => true do |t|
    t.string   "uuid",       :limit => 36, :null => false
    t.string   "event_id",   :limit => 36, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :id => false, :force => true do |t|
    t.string   "uuid",                :limit => 36,                                 :null => false
    t.string   "original_event_id",   :limit => 36
    t.string   "name"
    t.text     "description"
    t.decimal  "latitude",                          :precision => 14, :scale => 10
    t.decimal  "longitude",                         :precision => 14, :scale => 10
    t.string   "place_id",            :limit => 36,                                 :null => false
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "repeat_frequency_id", :limit => 36,                                 :null => false
    t.text     "cancelled_dates"
    t.string   "age_rating_id",       :limit => 36,                                 :null => false
    t.string   "price_id",            :limit => 36,                                 :null => false
    t.boolean  "gmaps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["age_rating_id"], :name => "index_events_on_age_rating_id"
  add_index "events", ["end_at"], :name => "index_events_on_end_at"
  add_index "events", ["latitude", "longitude"], :name => "index_events_on_latitude_and_longitude"
  add_index "events", ["latitude"], :name => "index_events_on_latitude"
  add_index "events", ["longitude"], :name => "index_events_on_longitude"
  add_index "events", ["original_event_id"], :name => "index_events_on_original_event_id"
  add_index "events", ["place_id"], :name => "index_events_on_place_id"
  add_index "events", ["price_id"], :name => "index_events_on_price_id"
  add_index "events", ["start_at", "end_at"], :name => "index_events_on_start_at_and_end_at"
  add_index "events", ["start_at"], :name => "index_events_on_start_at"

  create_table "places", :id => false, :force => true do |t|
    t.string   "uuid",        :limit => 36,                                                    :null => false
    t.string   "name"
    t.text     "description"
    t.decimal  "latitude",                  :precision => 14, :scale => 10
    t.decimal  "longitude",                 :precision => 14, :scale => 10
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country",                                                   :default => "USA"
    t.boolean  "gmaps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", :id => false, :force => true do |t|
    t.string   "uuid",       :limit => 36, :null => false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repeat_frequencies", :id => false, :force => true do |t|
    t.string   "uuid",       :limit => 36, :null => false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_tokens", :id => false, :force => true do |t|
    t.string   "uuid",       :limit => 36, :null => false
    t.string   "user_id",    :limit => 36, :null => false
    t.string   "provider",                 :null => false
    t.string   "uid",                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :id => false, :force => true do |t|
    t.string   "uuid",                   :limit => 36,                     :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "time_zone"
    t.boolean  "deleted",                               :default => false, :null => false
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
