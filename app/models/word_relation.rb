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

  ### Modules ###
  
  ### Model settings ###

  self.table_name = "words_relations"
  
  ### Class macros ###

  ### Misc macros ###
  
  ### Associations ###

	belongs_to :preceding_word, class_name: "Word"
	belongs_to :following_word, class_name: "Word"

  ### Callbacks ###

  ### Scopes ###

  scope :weighted, -> { order("(RANDOM()*occurence_counter)").limit(1) }

  ### Class methods ###

  ### Instance methods ###


end
