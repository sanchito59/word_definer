class Word
    attr_reader :name, :id
    @@words = {}
    @@total_rows = 0
  
    def initialize(name, id)
      @name = name
      @id = id || @@total_rows += 1
    end
end