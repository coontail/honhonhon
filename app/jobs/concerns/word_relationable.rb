module WordRelationable

  def create_word_relation(word, following_word)
    Word.transaction do
      relation = word.following_word_relations.find_or_create_by(following_word: following_word)
      update_relation_counter(relation)
    end
  end

  def update_relation_counter(relation)
    relation.update(occurence_counter: relation.occurence_counter + 1)
  end

end
