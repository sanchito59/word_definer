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
        it('is the same definition if it has the same attributes as another definition') do
            meaning = Definition.new('the power or quality of giving delight or admiration', @word.id, nil)
            meaning.save()
            meaning2 = Definition.new('the power or quality of giving delight or admiration', @word.id, nil)
            meaning2.save()
          expect(meaning).to(eq(meaning2))
        end
      end
    
      describe('.clear') do
        it('clears all definitions') do
            meaning = Definition.new('the power or quality of giving delight or admiration', @word.id, nil)
            meaning.save()
            meaning2 = Definition.new('a small ornament worn on a necklace or bracelet', @word.id, nil)
            meaning2.save()
            Definition.clear()
          expect(Definition.all).to(eq([]))
        end
      end
      describe('.find') do
        it("finds a definition by id") do
            meaning = Definition.new('the power or quality of giving delight or admiration', @word.id, nil)
            meaning.save()
            meaning2 = Definition.new('a small ornament worn on a necklace or bracelet', @word.id, nil)
            meaning2.save()
          expect(Definition.find(meaning.id)).to(eq(meaning))
          expect(Definition.find(meaning2.id)).to(eq(meaning2))
        end
      end
    
      describe('#update') do
        it("updates an definition by id") do
            meaning = Definition.new('the power or quality of giving delight or admiration', @word.id, nil)
            meaning.save()
            meaning.update('a small ornament worn on a necklace or bracelet', @word.id)
          expect(meaning.meaning).to(eq("a small ornament worn on a necklace or bracelet"))
        end
      end
    
      describe('#delete') do
        it("deletes a definition by ID") do
            meaning = Definition.new('the power or quality of giving delight or admiration', @word.id, nil)
            meaning.save()
            meaning2 = Definition.new('a small ornament worn on a necklace or bracelet', @word.id, nil)
            meaning2.save()
            meaning.delete()
          expect(Definition.all).to(eq([meaning2]))
        end
      end
end