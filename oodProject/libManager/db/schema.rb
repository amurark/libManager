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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151008064946) do

  create_table "books", force: :cascade do |t|
    t.integer  "ISBN",        limit: 4
    t.string   "Title",       limit: 255
    t.string   "Authors",     limit: 255
    t.string   "Description", limit: 255
    t.boolean  "Status",                  default: false, null: false
    t.string   "Lastuser",    limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "books", ["ISBN"], name: "index_books_on_ISBN", unique: true, using: :btree

  create_table "histories", force: :cascade do |t|
    t.integer  "book_isbn",     limit: 4
    t.string   "user_email",    limit: 255
    t.string   "book_title",    limit: 255
    t.string   "book_author",   limit: 255
    t.datetime "checkout_time"
    t.datetime "return_time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "ISBN",       limit: 4
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.integer  "pn",              limit: 4
    t.integer  "ty",              limit: 4
    t.integer  "age",             limit: 4
    t.boolean  "sex"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
    t.string   "remember_token",  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
