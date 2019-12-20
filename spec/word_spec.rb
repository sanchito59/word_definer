require 'rspec'
require 'word'
require 'definition'

describe '#word' do
    # before(:each) do
    #   Word.clear()
    # end
  
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
end