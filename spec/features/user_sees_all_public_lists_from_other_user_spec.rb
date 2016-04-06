require 'rails_helper'

feature 'User sees all public lists from other users' do
  scenario 'successfuly' do
    user = create(:user)
    other_user = create(:user)
    sign_in(user)

    other_user_lists = create_list(:list, 5, user: other_user)
    user_lists = create_list(:list, 5, user: user)

    visit public_lists_path

    other_user_lists.each do |list|
      expect(page).to have_link list.name
    end
    user_lists.each do |list|
      expect(page).not_to have_link list.name
    end
  end
end
