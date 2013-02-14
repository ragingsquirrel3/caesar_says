require 'spec_helper'

# use Chrome driver, download with homebrew if there is no 
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe 'app' do
  
  before do
    visit root_path
  end

  it "can add 'V + V' and get X", js: true do
    fill_in 'problem', with: 'V + V'
    find('#solve-button').click
    find('#solution').should have_content 'X'
  end
  
  it "can multiply 'X * X'", js: true do
    fill_in 'problem', with: 'X * X'
    find('#solve-button').click
    find('#solution').should have_content 'C'
  end
  
end
