# == Schema Information
#
# Table name: words
#
#  created_at     :datetime
#  id             :integer          not null, primary key
#  phonetic_value :string
#  updated_at     :datetime
#  value          :string
#

class Word < ActiveRecord::Base

	has_many :preceding_word_relations, foreign_key: :following_word_id, class_name: "WordRelation"
	has_many :following_word_relations, foreign_key: :preceding_word_id, class_name: "WordRelation"
	has_many :preceding_words, through: :preceding_word_relations
	has_many :following_words, through: :following_word_relations


end
