require 'rspec'
require 'word'
require 'definition'

describe '#definition' do
    before(:each) do
        Word.clear()
        Definition.clear()
        @word = Word.new('charm', nil)
        @word.save
      end
  
    describe('.all') do
      it('returns an empty array when there are no definitions') do
        expect(Definition.all).to(eq([]))
      end
    end

    describe('#save') do
      it('saves a definition') do
        meaning = Definition.new('the power or quality of giving delight or admiration', @word.id, nil)
        meaning.save()
        meaning2 = Definition.new('a small ornament worn on a necklace or bracelet', @word.id, nil)
        meaning2.save()
        expect(Definition.all).to(eq([meaning, meaning2]))
      end
    end

    describe('#==') do
        it('is the same meaning if it has the same attributes as another meaning') do
            meaning = Definition.new('the power or quality of giving delight or admiration', @word.id, nil)
            meaning.save()
            meaning2 = Definition.new('the power or quality of giving delight or admiration', @word.id, nil)
            meaning2.save()
          expect(meaning).to(eq(meaning2))
        end
      end
    
      describe('.clear') do
        it('clears all words') do
            meaning = Definition.new('the power or quality of giving delight or admiration', @word.id, nil)
            meaning.save()
            meaning2 = Definition.new('a small ornament worn on a necklace or bracelet', @word.id, nil)
            meaning2.save()
            Definition.clear()
          expect(Definition.all).to(eq([]))
        end
      end
end