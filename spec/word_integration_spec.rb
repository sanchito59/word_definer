require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

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