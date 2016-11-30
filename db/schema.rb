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

ActiveRecord::Schema.define(version: 20161130000447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "userid",     null: false
    t.boolean  "shipping"
    t.boolean  "billing"
    t.string   "name"
    t.string   "company"
    t.string   "address",    null: false
    t.string   "address_2"
    t.string   "city",       null: false
    t.integer  "stateid",    null: false
    t.string   "zip",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.integer  "userid",           null: false
    t.boolean  "default"
    t.integer  "last_four",        null: false
    t.string   "nickname"
    t.string   "merchant_id",      null: false
    t.string   "merchant_card_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["merchant_card_id"], name: "index_cards_on_merchant_card_id", unique: true, using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "userid",     null: false
    t.integer  "productid",  null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "tag",         null: false
    t.index ["description"], name: "index_categories_on_description", unique: true, using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "orderid",    null: false
    t.string   "title",      null: false
    t.float    "price",      null: false
    t.integer  "quantity",   null: false
    t.float    "discount"
    t.float    "tax",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "userid",         null: false
    t.integer  "transaction_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["transaction_id"], name: "index_orders_on_transaction_id", unique: true, using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.float    "price",       null: false
    t.string   "sku",         null: false
    t.integer  "categoryid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sku"], name: "index_products_on_sku", unique: true, using: :btree
    t.index ["title"], name: "index_products_on_title", unique: true, using: :btree
  end

  create_table "shipment_items", force: :cascade do |t|
    t.integer  "shipmentid", null: false
    t.integer  "itemid",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.integer  "orderid"
    t.string   "status"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "abbr",       null: false
    t.string   "full",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbr"], name: "index_states_on_abbr", unique: true, using: :btree
    t.index ["full"], name: "index_states_on_full", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "name",       null: false
    t.string   "p_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
