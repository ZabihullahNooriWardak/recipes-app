# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_31_152525) do
ActiveRecord::Schema[7.1].define(version: 2024_01_31_101233) do
ActiveRecord::Schema[7.1].define(version: 2024_01_31_152525) do
ActiveRecord::Schema[7.1].define(version: 2024_01_31_101234) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_inventories", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "inventory_id", null: false
    t.bigint "food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_food_inventories_on_food_id"
    t.index ["inventory_id"], name: "index_food_inventories_on_inventory_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "measurement_unit"
    t.integer "price"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "preparation_time"
    t.string "cooking_time"
    t.text "description"
    t.boolean "public"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "foods", "users"
  add_foreign_key "inventories", "users"
  add_foreign_key "food_inventories", "foods", on_delete: :cascade
  add_foreign_key "food_inventories", "inventories", on_delete: :cascade
  add_foreign_key "food_recipes", "foods"
  add_foreign_key "food_recipes", "recipes"
  add_foreign_key "foods", "users"
  add_foreign_key "inventories", "users"
  add_foreign_key "recipes", "users"
end
