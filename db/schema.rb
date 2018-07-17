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

ActiveRecord::Schema.define(version: 2018_07_17_075218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_types", force: :cascade do |t|
    t.text "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.bigint "animal_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_type_id"], name: "index_breeds_on_animal_type_id"
  end

  create_table "operating_hours", force: :cascade do |t|
    t.bigint "shelter_id"
    t.integer "day_of_week"
    t.time "open"
    t.time "close"
    t.index ["shelter_id"], name: "index_operating_hours_on_shelter_id"
  end

  create_table "pet_pics", force: :cascade do |t|
    t.text "url"
    t.bigint "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_pet_pics_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.date "date_of_birth"
    t.integer "animal_type_id"
    t.string "colour"
    t.string "size"
    t.boolean "vacc_status"
    t.bigint "shelter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "breed_id"
    t.text "description"
  end

  create_table "pets_users", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "user_id"
  end

  create_table "shelter_types", force: :cascade do |t|
    t.text "type_name"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "postcode"
    t.string "address"
    t.string "suburb"
    t.string "state"
    t.integer "shelter_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
    t.text "url"
    t.string "phone"
    t.string "email"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "password_digest"
    t.boolean "admin"
    t.integer "shelter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  add_foreign_key "breeds", "animal_types"
  add_foreign_key "pet_pics", "pets"
end
