class Word
    attr_reader :id
    attr_accessor :term
    
    @@words = {}
    @@total_rows = 0
  
    def initialize(term, id)
      @term = term.downcase()
      @id = id || @@total_rows += 1
    end

    def self.all
        @@words.values()
    end

    def save
        @@words[self.id] = Word.new(self.term, self.id)
    end 

    def ==(word_to_compare)
        self.term() == word_to_compare.term()
    end
    
    def self.clear
        @@words = {}
        @@total_rows = 0
    end

    def self.find(id)
        @@words[id]
    end

    def self.sort
        @@words.values.sort { |a, b| a.term <=> b.term }
    end

    def update(term)
        @term = (term != '') ? term : @term
    end

    def delete
        @@words.delete(self.id)
    end

    def self.search(search_term)
        @@words.values.select { |word| word.term =~ /#{search_term}/i }
     end

    def meanings
        Definition.find_by_word(self.id)
    end
end