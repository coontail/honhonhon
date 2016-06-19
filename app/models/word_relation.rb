# == Schema Information
#
# Table name: words_relations
#
#  created_at        :datetime
#  following_word_id :integer
#  id                :integer          not null, primary key
#  occurence_counter :integer          default(0)
#  preceding_word_id :integer
#  updated_at        :datetime
#

class WordRelation < ActiveRecord::Base

  ### Model settings ###

	self.table_name = "words_relations"
  
  ### Modules ###

  ### Associations ###

	belongs_to :preceding_word, class_name: "Word"
	belongs_to :following_word, class_name: "Word"

  ### Callbacks ###

  ### Scopes ###

  ### Class macros ###

  ### Misc macros ###

  ### Class methods ###

  ### Instance methods ###


end
