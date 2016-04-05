require 'rails_helper'

feature 'User sees all his lists' do
  scenario 'successfuly' do
    user = create(:user)
    sign_in(user)

    public_lists = create_list(:list, 5, user: user)
    private_lists = create_list(:list, 5, user: user, private: true)

    visit lists_path

    public_lists.each do |list|
      expect(page).to have_link list.name
    end
    private_lists.each do |list|
      expect(page).to have_link list.name
    end
  end
end
