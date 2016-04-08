require 'rails_helper'

feature 'User sees all his lists' do
  scenario 'successfuly' do
    user = create(:user)
    sign_in(user)

    public_lists = create_list(:list, 5, user: user)
    private_lists = create_list(:list, 5, user: user, private: true)

    visit lists_path

    expect(page).to have_selector 'h1', text: 'Your Lists'

    public_lists.each do |list|
      expect(page).to have_link list.name
    end
    private_lists.each do |list|
      expect(page).to have_link list.name
    end
  end

  scenario 'and not others\' lists' do
    user = create(:user)
    user2 = create(:user)
    sign_in(user)

    other_lists = create_list(:list, 5, user: user2)

    visit lists_path

    other_lists.each do |list|
      expect(page).not_to have_link list.name
    end
  end
end
