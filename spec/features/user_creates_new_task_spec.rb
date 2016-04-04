require 'rails_helper'

feature 'User creates a new task' do
  scenario 'successfuly' do
    user = create(:user)
    sign_in(user)
    list = create(:list, user: user)
    task = create(:task, list: list)

    visit list_path list

    fill_in 'task[name]', with: task.name
    click_on 'Create task'

    within '.task-list' do
      expect(page).to have_content task.name
    end
  end
end
