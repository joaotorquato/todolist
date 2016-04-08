require 'rails_helper'

feature 'User sees all his favorite lists' do
  scenario 'successfuly' do
    user = create(:user)
    other_user = create(:user)
    sign_in(user)

    user_list = create(:list, user: user)
    other_user_list = create(:list, user: other_user, private: false)

    favorite_list_1 = create(:favorite_list, user: user, list: user_list)
    favorite_list_2 = create(:favorite_list, user: user, list: other_user_list)

    visit favorite_lists_path

    expect(page).to have_selector 'h1', text: 'Your Favorite Lists'

    expect(page).to have_link favorite_list_1.list.name
    expect(page).to have_link favorite_list_2.list.name
  end
end
