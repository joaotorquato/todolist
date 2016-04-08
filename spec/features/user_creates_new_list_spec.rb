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

  scenario 'unsuccessfuly' do
    user = create(:user)
    sign_in(user)

    click_on 'Create a new list'

    click_on 'Create'

    %w(name).each do |field|
      within(".list_#{field}") do
        expect(page).to have_content "can't be blank"
      end
    end
  end
end
