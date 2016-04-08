require 'rails_helper'

feature 'User marks others\' public list as favorite' do
  scenario 'successfuly' do
    user = create(:user)
    other_user = create(:user)
    sign_in(user)

    other_user_list = create(:list, user: other_user)
    visit public_lists_path

    within "#list-#{other_user_list.id}" do
      favorite_link = mark_favorite_list_path(other_user_list)
      expect(page).to have_link 'Mark as favorite', href: favorite_link
      click_on 'Mark as favorite'
    end

    expect(page.current_path).to eq public_lists_path
    expect(page).to have_content 'List was mark as favorite successfuly.'
    within "#list-#{other_user_list.id}" do
      expect(page).to have_link 'Unmark as favorite'
    end
  end
end
