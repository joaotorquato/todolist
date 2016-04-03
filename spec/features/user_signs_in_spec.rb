require 'rails_helper'

feature 'User signs in' do
  scenario 'successfuly' do
    create(:user)

    visit root_path

    click_on 'sign in'

    fill_in 'user[email]', with: 'joao.otl@gmail.com'
    fill_in 'user[password]', with: 'plataformatec123'

    click_on 'Log in'

    expect(page).to have_content 'joao.otl@gmail.com'
    expect(page).to have_content 'Sign out'
  end
end
