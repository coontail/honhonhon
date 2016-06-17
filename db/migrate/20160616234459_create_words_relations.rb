class CreateWordsRelations < ActiveRecord::Migration
  
  def change
    create_table :words_relations do |t|
    	t.integer :preceding_word_id
    	t.integer :following_word_id
    	t.integer :occurence_counter
    	t.timestamps
    end
  end

end
