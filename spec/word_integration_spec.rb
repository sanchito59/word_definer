require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

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
      fill_in('definition', :with => 'a sinful fruit')
      click_on('Add definition')
      expect(page).to have_content('a sinful fruit')
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

describe('Delete word', {:type => :feature}) do
    it('will navigate to the update word page and delete the word') do
        Word.clear()
        word = Word.new("apple", nil)
        word.save
        visit("/words/#{word.id}")
        click_on('Edit word')
        click_on('Delete Word')
        expect(page).not_to have_content('apple')
    end
end