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

	### Modules ###

	### Model settings ###

	### Class macros ###

	### Misc macros ###

	### Associations ###

	has_many :preceding_word_relations,
		-> { weighted },
		foreign_key: :following_word_id,
		class_name: "WordRelation",
		dependent: :destroy

	has_many :following_word_relations,
		-> { weighted },
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

	scope :valid, -> { where.not("phonetic_value = '' OR syllables_count = 0") }
	scope :inpronounceable, -> { where("phonetic_value = '' OR syllables_count = 0") }
	scope :containing_numbers, -> { where("value ~ E?", '[0-9]') }

	### Class methods ###

	def self.get_random_rhyming_word
	  valid.sample(100).detect do |word|
	  	word.rhyming_words.any?
	  end
	end

	### Instance methods ###

	# To be replaced with a :rhyming scope asap
	def rhyming_words
		Word.where.not(id: id).where(
			"right(phonetic_value, 2) = ?", "#{phonetic_value.last(2)}"
		)
	end

	private

	def set_phonetic_value_and_syllables_count
		syllables = Voxbi.new(value).get_syllables

		self.phonetic_value = syllables.join
		self.syllables_count = syllables.count
	end

end
