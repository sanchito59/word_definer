require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Integration Test') do
    before(:each) do
        Word.clear()
        Definition.clear()
    end

    describe('create an word path', {:type => :feature}) do
        it('creates a word and then goes to the words page') do
        visit('/words')
        click_on('Add a new word')
        fill_in('word', :with => 'canary')
        click_on('Enter!')
        expect(page).to have_content('canary')
        end
    end

    describe('create a definition path', {:type => :feature}) do
        it('creates a definition and then goes to the definition page') do
        word = Word.new("apple", nil)
        word.save
        visit("/words/#{word.id}")
        fill_in('definition', :with => "definition")
        click_on('Add definition')
        expect(page).to have_content("definition")
        end
    end

    describe('Update \'word\' path', {:type => :feature}) do
        it('will navigate to the update word page and change the word') do
            word = Word.new("apple", nil)
            word.save
            visit("/words/#{word.id}")
            click_on('Edit word')
            fill_in('term', :with => 'peach')
            click_on('Update Word')
            expect(page).to have_content('peach')
        end
    end

    describe('Update \'definition\' path', {:type => :feature}) do
        it('will navigate to the update definition page and change the definition') do
            word = Word.new("apple", nil)
            word.save
            definition = Definition.new("definition", word.id, nil)
            definition.save
            visit("/words/#{word.id}/definitions/#{word.id}")
            click_on('definition')
            fill_in('definition', with => 'new definition')
            click_on('Update')
            expect(page).to have_content("apple" && "new definition")
        end
    end

    describe('Delete word', {:type => :feature}) do
        it('will navigate to the update word page and delete the word') do
            word = Word.new("apple", nil)
            word.save
            visit("/words/#{word.id}")
            click_on('Edit word')
            click_on('Delete Word')
            expect(page).not_to have_content('apple')
        end
    end

    describe('Delete definition', {:type => :feature}) do
        it('will navigate to the update word page and delete the word') do
            word = Word.new("apple", nil)
            word.save
            definition = Definition.new("definition", word.id, nil)
            definition.save
            visit("/words/#{word.id}/definitions/#{word.id}")
            click_on('Delete')
            expect(page).not_to have_content("definition")
        end
    end
end

