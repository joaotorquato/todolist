require 'rails_helper'

feature 'User creates a new list' do
  scenario 'successfuly' do
    sign_in

    click_on 'Create a new list'

    fill_in 'list[name]', with: 'List #1'

    click_on 'Create'

    expect(page).to have_content 'To-Do List'
    expect(page).to have_content 'List #1'
    expect(page).to have_content 'Public'
    expect(page).to have_content 'joao.otl@gmail.com'
  end
end
