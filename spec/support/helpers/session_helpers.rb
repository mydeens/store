module Features
  module SessionHelpers
    def sign_up_with(email, password, confirmation, country_code, phone_number)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', :with => confirmation
      fill_in 'user[country_code]', with: country_code
      fill_in 'user[phone_number]', with: phone_number
      click_button 'Sign up'
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign in'
    end
  end
end
