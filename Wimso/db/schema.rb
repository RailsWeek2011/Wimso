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

ActiveRecord::Schema.define(:version => 20110727134629) do

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "run_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["run_id"], :name => "index_comments_on_run_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

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

  create_table "episodes", :force => true do |t|
    t.integer  "nr"
    t.date     "datum"
    t.string   "title"
    t.decimal  "rating"
    t.integer  "anz_rating"
    t.integer  "run_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "episodes", ["run_id"], :name => "index_episodes_on_run_id"

  create_table "friends_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  add_index "friends_users", ["user_id", "friend_id"], :name => "index_friends_users_on_user_id_and_friend_id", :unique => true

  create_table "runs", :force => true do |t|
    t.string   "name"
    t.integer  "anz_staf"
    t.integer  "anz_eps"
    t.decimal  "rating"
    t.integer  "comments_id"
    t.integer  "episodes_id"
    t.integer  "anz_rating"
    t.boolean  "global"
    t.integer  "tag_id"
    t.integer  "user_runs_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "runs", ["comments_id"], :name => "index_runs_on_comments_id"
  add_index "runs", ["episodes_id"], :name => "index_runs_on_episodes_id"
  add_index "runs", ["tag_id"], :name => "index_runs_on_tag_id"
  add_index "runs", ["user_runs_id"], :name => "index_runs_on_user_runs_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "run_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["run_id"], :name => "index_tags_on_run_id"

  create_table "user_runs", :force => true do |t|
    t.integer  "interval"
    t.integer  "comments_id"
    t.integer  "curr_eps"
    t.integer  "user_id"
    t.integer  "run_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_runs", ["comments_id"], :name => "index_user_runs_on_comments_id"
  add_index "user_runs", ["run_id"], :name => "index_user_runs_on_run_id"
  add_index "user_runs", ["user_id"], :name => "index_user_runs_on_user_id"

  create_table "users", :force => true do |t|
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
    t.string   "name"
    t.boolean  "privacy_flag"
    t.boolean  "is_admin"
    t.integer  "user_id"
    t.integer  "user_run_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["user_id"], :name => "index_users_on_user_id"
  add_index "users", ["user_run_id"], :name => "index_users_on_user_run_id"

end
