class Word
    attr_reader :name, :id
    @@words = {}
    @@total_rows = 0
  
    def initialize(name, id)
      @name = name
      @id = id || @@total_rows += 1
    end

    def self.all
        @@words.values()
    end

    def save
        @@words[self.id] = Word.new(self.name, self.id)
    end 

    def ==(word_to_compare)
        self.name() == word_to_compare.name()
    end
end