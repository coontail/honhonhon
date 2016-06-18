# == Schema Information
#
# Table name: words
#
#  created_at      :datetime
#  id              :integer          not null, primary key
#  phonetic_value  :string
#  syllables_count :integer
#  updated_at      :datetime
#  value           :string
#

class Word < ActiveRecord::Base

	has_many :preceding_word_relations, 
		foreign_key: :following_word_id, 
		class_name: "WordRelation", 
		dependent: :destroy

	has_many :following_word_relations, 
		foreign_key: :preceding_word_id, 
		class_name: "WordRelation",
		dependent: :destroy

	has_many :preceding_words, through: :preceding_word_relations
	has_many :following_words, through: :following_word_relations

	validates :value, presence: true, uniqueness: true

	before_save :set_phonetic_value_and_syllables_count

	scope :valid, -> { where.not(phonetic_value: '') }

	def set_phonetic_value_and_syllables_count
		syllables = Voxbi.get_pairs(value) - ["_"]

		self.phonetic_value = syllables.join
		self.syllables_count = syllables.count
	end

end
