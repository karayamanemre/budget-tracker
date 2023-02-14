require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
  scenario 'valid inputs' do
    visit new_user_registration_path
    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'SIGN UP'
    expect(page).to have_content('Categories')
  end
end
