require 'rails_helper'

feature 'User signs in' do
  scenario 'successfuly' do
    user = create(:user)

    visit root_path

    click_on 'sign in'

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password

    click_on 'Log in'

    expect(page).to have_content user.email
    expect(page).to have_content 'Sign out'
  end
end
