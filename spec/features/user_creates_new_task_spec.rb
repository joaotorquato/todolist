require 'rails_helper'

feature 'User creates a new task', js: true do
  scenario 'successfuly' do
    user = create(:user)
    sign_in(user)
    list = create(:list, user: user)

    visit list_path list

    fill_in 'task[name]', with: 'Task #1'
    click_on 'Create Task'

    within '.task-list' do
      expect(page).to have_content 'Task #1'
    end
  end

  scenario 'unsuccessfuly' do
    user = create(:user)
    sign_in(user)
    list = create(:list, user: user)

    visit list_path list

    fill_in 'task[name]', with: ''
    click_on 'Create Task'

    expect(page).to have_content 'An error has occurred!'
  end
end
