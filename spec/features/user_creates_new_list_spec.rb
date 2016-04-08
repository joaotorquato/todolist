require 'rails_helper'

feature 'User creates a new list' do
  scenario 'successfuly' do
    user = create(:user)
    sign_in(user)
    list = build(:list, user: user, private: false)

    click_on 'Create a new list'

    fill_in 'list[name]', with: list.name
    choose 'No'

    click_on 'Create'

    within '.list-details' do
      expect(page).to have_content list.name
      expect(page).to have_content 'Public'
      expect(page).to have_content list.user.email
    end
  end
end
