class CreateWords < ActiveRecord::Migration
  
  def change
    create_table :words do |t|
  		t.string :value
  		t.string :phonetic_value

  		t.timestamps
    end

    add_index :words, :value
    add_index :words, :phonetic_value
  end

end
