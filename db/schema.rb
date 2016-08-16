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

ActiveRecord::Schema.define(version: 20160816021904) do

  create_table "countries", force: :cascade do |t|
    t.string  "iso_name"
    t.string  "iso"
    t.string  "iso3"
    t.string  "name"
    t.integer "numcode"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["organization_id"], name: "index_customers_on_organization_id"

  create_table "invoices", force: :cascade do |t|
    t.string   "customer"
    t.string   "number"
    t.string   "order_number"
    t.date     "invoice_date"
    t.string   "salesperson"
    t.string   "terms"
    t.date     "due_date"
    t.integer  "total"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["organization_id"], name: "index_invoices_on_organization_id"

  create_table "line_items", force: :cascade do |t|
    t.string   "product"
    t.text     "description"
    t.integer  "amount"
    t.integer  "unit_price"
    t.integer  "invoice_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "line_items", ["invoice_id"], name: "index_line_items_on_invoice_id"

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "country"
    t.string   "currency"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

end
