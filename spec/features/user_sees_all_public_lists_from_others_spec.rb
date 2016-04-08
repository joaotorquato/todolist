require 'rails_helper'

feature 'User sees all the public lists from others' do
  scenario 'successfuly' do
    user = create(:user)
    other_user = create(:user)
    sign_in(user)

    other_user_lists = create_list(:list, 5, user: other_user)
    user_lists = create_list(:list, 5, user: user)

    visit public_lists_path

    expect(page).to have_selector 'h1', text: 'Public Lists'

    other_user_lists.each do |list|
      expect(page).to have_link list.name
    end
    user_lists.each do |list|
      expect(page).not_to have_link list.name
    end
  end
end
