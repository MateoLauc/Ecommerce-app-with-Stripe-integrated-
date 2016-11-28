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

ActiveRecord::Schema.define(version: 20161113200033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "imeprezime"
    t.string   "naziv"
    t.string   "city"
    t.string   "regija"
    t.integer  "zip"
    t.integer  "country_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree
  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "vrsta"
  end

  create_table "colors", force: :cascade do |t|
    t.string "color"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "cart_id"
    t.integer  "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.string   "nazivproivoda"
    t.integer  "qty"
    t.decimal  "cijena"
    t.integer  "size"
    t.string   "color"
    t.integer  "order_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "shippingAddress_id"
    t.integer  "billingAddress_id"
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "naziv"
    t.text     "opis"
    t.integer  "category_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "naziv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.integer "size"
  end

  create_table "user_infos", force: :cascade do |t|
    t.string   "broj"
    t.date     "datumRodjenja"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_infos", ["user_id"], name: "index_user_infos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "ime"
    t.string   "prezime"
    t.string   "email"
    t.string   "password"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "variants", force: :cascade do |t|
    t.integer "color_id"
    t.integer "size_id"
    t.integer "product_id"
    t.integer "qty"
    t.decimal "price"
  end

  add_index "variants", ["color_id"], name: "index_variants_on_color_id", using: :btree
  add_index "variants", ["product_id"], name: "index_variants_on_product_id", using: :btree
  add_index "variants", ["size_id"], name: "index_variants_on_size_id", using: :btree

  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "products", "categories"
  add_foreign_key "user_infos", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "variants", "colors"
  add_foreign_key "variants", "products"
  add_foreign_key "variants", "sizes"
end
