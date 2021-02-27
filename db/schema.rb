# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_27_091636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "name", default: "Admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "shipment_id", null: false
    t.decimal "amount_paid", null: false
    t.integer "payment_type", default: 0, comment: "1->belen, 2->dans"
    t.string "note", default: ""
    t.bigint "created_worker_id", null: false
    t.bigint "updated_worker_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", default: ""
    t.string "subject", default: ""
    t.text "note", default: ""
    t.boolean "status", default: false
    t.integer "post_type", default: 0, comment: "0 -> top slider, 1 -> news, 2 -> team"
  end

  create_table "shipment_objects", force: :cascade do |t|
    t.integer "shipment_id", null: false
    t.string "name", default: "", null: false
    t.string "note", default: ""
    t.integer "height", default: 0
    t.integer "width", default: 0
    t.integer "weight", default: 0
    t.integer "quantity", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shipment_status_histories", force: :cascade do |t|
    t.integer "shipment_id", null: false
    t.integer "status", default: 0, null: false, comment: "0->burgtesen, 1->zamd ywaa, 2->tulbur tologdson, 3->hurgegdsen"
    t.bigint "created_worker_id", null: false
    t.bigint "updated_worker_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.string "code", default: ""
    t.string "shipment_definition", default: "", null: false
    t.string "shipment_object_description", default: "", null: false
    t.string "about_payment", default: "", null: false
    t.string "note", default: ""
    t.datetime "delivery_date", null: false
    t.string "phone", default: "", null: false
    t.string "customer_phone", default: ""
    t.string "recipient_phone", default: ""
    t.string "email", default: ""
    t.string "customer_name", default: ""
    t.string "recipient_name", default: ""
    t.string "location_from", default: ""
    t.string "location_to", default: ""
    t.integer "status", default: 0, null: false, comment: "0->burgtesen, 1->zamd ywaa, 2->tulbur tologdson, 3->duussan"
    t.string "status_history", default: "", comment: "burgtesen, zamd ywaa, tulbur tologdson, duussan"
    t.datetime "delivered_date"
    t.decimal "price", default: "0.0", null: false
    t.bigint "created_worker_id", null: false
    t.bigint "updated_worker_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "name", default: ""
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_workers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
