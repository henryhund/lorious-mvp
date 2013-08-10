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

ActiveRecord::Schema.define(version: 20130808191720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_exchanges", force: true do |t|
    t.integer  "giver"
    t.integer  "receiver"
    t.integer  "number_of_credits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_exchanges", ["giver"], name: "index_credit_exchanges_on_giver", using: :btree
  add_index "credit_exchanges", ["receiver"], name: "index_credit_exchanges_on_receiver", using: :btree

  create_table "credit_payouts", force: true do |t|
    t.integer  "user_id"
    t.integer  "number_of_credits"
    t.integer  "dollar_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_purchases", force: true do |t|
    t.integer  "user_id"
    t.integer  "number_of_credits"
    t.integer  "dollar_amount"
    t.string   "stripe_id"
    t.integer  "stripe_fee"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "display_name"
    t.string   "tagline"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "stripe_customer_id"
    t.boolean  "active",                       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_4_digits",      limit: 4
    t.string   "card_type"
    t.string   "username"
    t.integer  "credit_balance",               default: 0
  end

end
