require 'rspec'
require 'word'
require 'definition'

describe '#word' do
    before(:each) do
      Word.clear()
    end
  
    describe('.all') do
      it('returns an empty array when there are no words') do
        expect(Word.all).to(eq([]))
      end
    end
    describe('#save') do
      it('saves a word') do
        word = Word.new('languid', nil)
        word.save()
        word2 = Word.new('jovial', nil)
        word2.save()
        expect(Word.all).to(eq([word, word2]))
      end
    end

    describe('#==') do
        it('is the same word if it is the same term as another word') do
          word = Word.new('spaghetti', nil)
          word2 = Word.new('spaghetti', nil)
          expect(word).to(eq(word2))
        end
      end
    
      describe('.clear') do
        it('clears all words') do
          word = Word.new('spaghetti', nil)
          word.save()
          word2 = Word.new('celestial', nil)
          word2.save()
          Word.clear()
          expect(Word.all).to(eq([]))
        end
      end

      describe('.find') do
        it('finds a word by id') do
          word = Word.new('spaghetti', nil)
          word.save()
          word2 = Word.new('celestial', nil)
          word2.save()
          expect(Word.find(word.id)).to(eq(word))
          expect(Word.find(word2.id)).to(eq(word2))
        end
    end

    describe('#sort') do
        it('sorts a list of words alphabetically') do
          word = Word.new('spaghetti', nil)
          word.save()
          word2 = Word.new('celestial', nil)
          word2.save()
          expect(Word.sort()).to(eq([word2, word]))
        end
    end

    describe('#update') do
        it('updates a word by id') do
            word = Word.new('spaghetty', nil)
            word.save()
            word2 = Word.new('celestial', nil)
            word2.save()
            word.update('spaghetti')
            word2.update('astronomical')
          expect(word.term).to(eq('spaghetti'))
          expect(word2.term).to(eq('astronomical'))
        end
      end

      describe('.delete') do
          it('deletes a word based on its ID') do
            word = Word.new('spaghetti', nil)
            word.save()
            word2 = Word.new('celestial', nil)
            word2.save()
            word.delete()
            expect(Word.all).to(eq([word2]))
          end
      end
end