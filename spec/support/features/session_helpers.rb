module Features
  module SessionHelpers
    def sign_in(user = nil)
      user = create(:user) if user.nil?
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_on 'Log in'
    end
  end
end
