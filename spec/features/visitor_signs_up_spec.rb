require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    visit root_path

    expect(page).to have_content 'You must sign up to create a list!'

    click_on 'sign up'

    fill_in 'user[email]', with: 'joao.otl@gmail.com'
    fill_in 'user[password]', with: 'plataformatec123'
    fill_in 'user[password_confirmation]', with: 'plataformatec123'

    click_on 'Sign up'

    expect(page).to have_content 'joao.otl@gmail.com'
    expect(page).to have_content 'Sign out'
  end
end
