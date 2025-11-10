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

ActiveRecord::Schema[7.1].define(version: 2024_11_08_000005) do
  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.date "birthday"
    t.text "occupation"
    t.string "img"
    t.string "status"
    t.string "nickname"
    t.text "appearance"
    t.string "portrayed"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_characters_on_category"
    t.index ["name"], name: "index_characters_on_name"
    t.index ["status"], name: "index_characters_on_status"
  end

  create_table "deaths", force: :cascade do |t|
    t.string "death", null: false
    t.string "cause", null: false
    t.string "responsible"
    t.string "last_words"
    t.integer "season"
    t.integer "episode"
    t.integer "number_of_deaths", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["death"], name: "index_deaths_on_death"
    t.index ["responsible"], name: "index_deaths_on_responsible"
    t.index ["season"], name: "index_deaths_on_season"
  end

  create_table "episodes", force: :cascade do |t|
    t.string "title", null: false
    t.integer "season", null: false
    t.integer "episode", null: false
    t.date "air_date"
    t.text "characters"
    t.string "series"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode"], name: "index_episodes_on_episode"
    t.index ["season", "episode"], name: "index_episodes_on_season_and_episode", unique: true
    t.index ["season"], name: "index_episodes_on_season"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_locations_on_city"
    t.index ["name"], name: "index_locations_on_name"
  end

  create_table "quotes", force: :cascade do |t|
    t.text "quote", null: false
    t.string "author", null: false
    t.string "series"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author"], name: "index_quotes_on_author"
  end

end
