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

ActiveRecord::Schema.define(:version => 20120909214413) do

  create_table "categories", :force => true do |t|
    t.string   "ebay_cat_name"
    t.integer  "ebay_cat_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "ancestry"
    t.integer  "parent_id"
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"

  create_table "searches", :force => true do |t|
    t.string   "query"
    t.integer  "category"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "searches", ["user_id", "created_at"], :name => "index_searches_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "yabe_queries", :force => true do |t|
    t.string   "query"
    t.integer  "ebay_cat"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "rstr1"
    t.string   "rstr2"
    t.string   "rstr3"
    t.string   "rstr4"
    t.string   "rstr5"
    t.string   "rstr6"
    t.string   "rstr7"
    t.string   "rstr8"
    t.string   "rstr9"
    t.string   "rstr10"
    t.integer  "rint1"
    t.integer  "rint2"
    t.integer  "rint3"
    t.integer  "rint4"
    t.integer  "rint5"
    t.integer  "rint6"
    t.integer  "rint7"
    t.integer  "rint8"
    t.integer  "rint9"
    t.integer  "rint10"
    t.boolean  "rboo1"
    t.boolean  "rboo2"
    t.boolean  "rboo3"
    t.boolean  "rboo4"
    t.boolean  "rboo5"
    t.boolean  "rboo6"
    t.boolean  "rboo7"
    t.boolean  "rboo8"
    t.boolean  "rboo9"
    t.boolean  "rboo10"
    t.float    "rflo1"
    t.float    "rflo2"
    t.float    "rflo3"
    t.float    "rflo4"
    t.float    "rflo5"
    t.float    "rflo6"
    t.float    "rflo7"
    t.float    "rflo8"
    t.float    "rflo9"
    t.float    "rflo10"
    t.decimal  "rdec1"
    t.decimal  "rdec2"
    t.decimal  "rdec3"
    t.decimal  "rdec4"
    t.decimal  "rdec5"
    t.decimal  "rdec6"
    t.decimal  "rdec7"
    t.decimal  "rdec8"
    t.decimal  "rdec9"
    t.decimal  "rdec10"
    t.date     "rdat1"
    t.date     "rdat2"
    t.date     "rdat3"
    t.date     "rdat4"
    t.date     "rdat5"
    t.date     "rdat6"
    t.date     "rdat7"
    t.date     "rdat8"
    t.date     "rdat9"
    t.date     "rdat10"
    t.datetime "rdti1"
    t.datetime "rdti2"
    t.datetime "rdti3"
    t.datetime "rdti4"
    t.datetime "rdti5"
    t.datetime "rdti6"
    t.datetime "rdti7"
    t.datetime "rdti8"
    t.datetime "rdti9"
    t.datetime "rdti10"
    t.time     "rtim1"
    t.time     "rtim2"
    t.time     "rtim3"
    t.time     "rtim4"
    t.time     "rtim5"
    t.time     "rtim6"
    t.time     "rtim7"
    t.time     "rtim8"
    t.time     "rtim9"
    t.time     "rtim10"
  end

  add_index "yabe_queries", ["user_id", "created_at"], :name => "index_yabe_queries_on_user_id_and_created_at"

end
