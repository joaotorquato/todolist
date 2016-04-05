require 'rails_helper'

feature 'User sees list details' do
  scenario 'successfuly' do
    user = create(:user)
    sign_in(user)
    list = create(:list, user: user)
    tasks = create_list(:task, 10, list: list)

    visit lists_path

    click_on list.name

    within '.list-details' do
      expect(page).to have_content 'To-Do List'
      expect(page).to have_content list.name
      expect(page).to have_content 'Public'
      expect(page).to have_content list.user.email
    end

    within '.task-list' do
      tasks.each do |task|
        expect(page).to have_content task.name
      end
    end
  end
end
