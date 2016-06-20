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

	has_many :preceding_words, -> { valid }, through: :preceding_word_relations
	has_many :following_words, -> { valid }, through: :following_word_relations
	
	### Validations ###

	validates :value, presence: true, uniqueness: true

	### Callbacks ###

	before_save :set_phonetic_value_and_syllables_count

	### Scopes ###

	scope :rhyming_with, -> (word) { 
		where.not(id: word.id).where(
			"right(phonetic_value, 2) = ?", "#{word.phonetic_value.last(2)}"
		)
	}

	scope :valid, -> { where.not("phonetic_value = '' OR syllables_count = 0") }
	scope :inpronounceable, -> { where("phonetic_value = '' OR syllables_count = 0") }
	scope :containg_numbers, -> { where("value ~ E?", '[0-9]') }
	
	### Class macros ###

	### Misc macros ###
	
	### Class methods ###

	def self.get_random_rhyming_word
	  valid.sample(100).detect{ |word| Word.rhyming_with(word).any? }
	end

	### Instance methods ###

	def rhyming_words
		rhyming_with(self)
	end

	private 

	def set_phonetic_value_and_syllables_count
		syllables = Voxbi.get_syllables(value)

		self.phonetic_value = syllables.join
		self.syllables_count = syllables.count
	end

end
