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

ActiveRecord::Schema.define(version: 20_231_011_132_131) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'easy_medical_checkups', force: :cascade do |t|
    t.bigint 'user_id'
    t.integer 'height', null: false
    t.integer 'weight', null: false
    t.integer 'blood_pressure_up', null: false
    t.integer 'blood_pressure_down', null: false
    t.integer 'total_cholesterol', null: false
    t.integer 'hdl_cholesterol', null: false
    t.integer 'ldl_cholesterol', null: false
    t.integer 'neutral_fat', null: false
    t.integer 'ast', null: false
    t.integer 'alt', null: false
    t.integer 'gamma_gtp', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_easy_medical_checkups_on_user_id'
  end

  create_table 'full_medical_checkups', force: :cascade do |t|
    t.bigint 'user_id'
    t.integer 'fasting_blood_sugar', null: false
    t.decimal 'hba1c', null: false
    t.integer 'urine_sugar', null: false
    t.decimal 'uric_acid', null: false
    t.decimal 'creatinine', null: false
    t.decimal 'egfr', null: false
    t.integer 'hematocrit', null: false
    t.integer 'hemoglobin', null: false
    t.integer 'rbc', null: false
    t.integer 'wbc', null: false
    t.integer 'urine_protein', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_full_medical_checkups_on_user_id'
  end

  create_table 'supplement_tags', force: :cascade do |t|
    t.bigint 'supplement_id', null: false
    t.bigint 'tag_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['supplement_id'], name: 'index_supplement_tags_on_supplement_id'
    t.index ['tag_id'], name: 'index_supplement_tags_on_tag_id'
  end

  create_table 'supplements', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'taggings', force: :cascade do |t|
    t.bigint 'tag_id', null: false
    t.bigint 'easy_medical_checkup_id', null: false
    t.bigint 'full_medical_checkup_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['easy_medical_checkup_id'], name: 'index_taggings_on_easy_medical_checkup_id'
    t.index ['full_medical_checkup_id'], name: 'index_taggings_on_full_medical_checkup_id'
    t.index ['tag_id'], name: 'index_taggings_on_tag_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'up_or_down', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['name'], name: 'index_users_on_name'
  end

  add_foreign_key 'supplement_tags', 'supplements'
  add_foreign_key 'supplement_tags', 'tags'
  add_foreign_key 'taggings', 'easy_medical_checkups'
  add_foreign_key 'taggings', 'full_medical_checkups'
  add_foreign_key 'taggings', 'tags'
end
