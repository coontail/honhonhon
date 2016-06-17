# == Schema Information
#
# Table name: words_relations
#
#  created_at        :datetime
#  following_word_id :integer
#  id                :integer          not null, primary key
#  occurence_counter :integer
#  preceding_word_id :integer
#  updated_at        :datetime
#

class WordRelation < ActiveRecord::Base

	self.table_name = "words_relations"

	belongs_to :preceding_word, class_name: "Word"
	belongs_to :following_word, class_name: "Word"

end
