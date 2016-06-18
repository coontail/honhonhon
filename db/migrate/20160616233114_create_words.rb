class CreateWords < ActiveRecord::Migration
  
  def change
    create_table :words do |t|
  		t.string :value
  		t.string :phonetic_value
  		t.integer :syllables_count
  		t.timestamps
    end

    add_index :words, :value
    add_index :words, :phonetic_value
    add_index :words, :syllables_count
  end

end
