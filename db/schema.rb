ActiveRecord::Schema.define(version: 20160616234459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "words", force: :cascade do |t|
    t.string   "value"
    t.string   "phonetic_value"
    t.integer  "syllables_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["phonetic_value"], name: "index_words_on_phonetic_value", using: :btree
  add_index "words", ["syllables_count"], name: "index_words_on_syllables_count", using: :btree
  add_index "words", ["value"], name: "index_words_on_value", using: :btree

  create_table "words_relations", force: :cascade do |t|
    t.integer  "preceding_word_id"
    t.integer  "following_word_id"
    t.integer  "occurence_counter", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
