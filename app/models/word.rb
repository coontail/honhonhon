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

	### Model settings ###

	### Modules ###

	### Associations ###

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
	
	### Validations ###

	validates :value, presence: true, uniqueness: true

	### Callbacks ###

	before_save :set_phonetic_value_and_syllables_count

	### Scopes ###

	scope :valid, -> { where.not(phonetic_value: '') }

	### Class macros ###

	### Misc macros ###

	### Class methods ###

	### Instance methods ###

	def rhyming_words
		Word.where(
			"phonetic_value LIKE ?", "%#{phonetic_value.last(2)}"
		).where.not(id: self.id)
	end

	private 

	def set_phonetic_value_and_syllables_count
		syllables = Voxbi.get_syllables(value)

		self.phonetic_value = syllables.join
		self.syllables_count = syllables.count
	end

end
