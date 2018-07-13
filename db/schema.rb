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

ActiveRecord::Schema.define(version: 2018_07_13_030602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_types", force: :cascade do |t|
    t.text "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.date "date_of_birth"
    t.integer "animaltype_id"
    t.string "colour"
    t.string "size"
    t.boolean "vacc_status"
    t.string "shelter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets_users", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "user_id"
  end

  create_table "shelter_types", force: :cascade do |t|
    t.text "type"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "postcode"
    t.string "address"
    t.string "suburb"
    t.string "state"
    t.integer "sheltertype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "password_digest"
    t.boolean "admin"
    t.integer "shelter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
