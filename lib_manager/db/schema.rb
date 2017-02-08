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

ActiveRecord::Schema.define(version: 20170208041651) do

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.string   "details"
    t.date     "birthday"
    t.integer  "publisher_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.integer  "number_of_pages"
    t.date     "year"
    t.string   "languages"
    t.string   "details"
    t.integer  "edition",         default: 0
    t.integer  "book_numbers"
    t.float    "rating"
    t.integer  "publisher_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "borrows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.date     "borrow_start"
    t.date     "borrow_end"
    t.boolean  "is_eccept",    default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["book_id"], name: "index_borrows_on_book_id"
    t.index ["user_id"], name: "index_borrows_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "rating_comment"
    t.string   "content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["book_id"], name: "index_comments_on_book_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.string   "add"
    t.integer  "phone"
    t.string   "email"
    t.integer  "fax"
    t.string   "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "ownerable_id"
    t.string   "ownerable_type"
    t.integer  "targetable_id"
    t.string   "targetable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin",        default: false
    t.string   "details"
    t.boolean  "is_borrow",       default: true
    t.integer  "borrow_out_date", default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
