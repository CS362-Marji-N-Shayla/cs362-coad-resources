require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

	it "creates a new user when I sign up" do
		visit signup_url
		fill_in 'Email address', with: 'fake99@fake.com'
		fill_in 'Password', with: 'FAKEPASSWORD'
		fill_in 'Password confirmation', with: 'FAKEPASSWORD'
		click_button 'Sign up'
		user = User.find_by(email: 'fake99@fake.com')
		visit user_confirmation_path(confirmation_token: user.confirmation_token)
		expect(page).to have_content('successfully confirmed')
	end

end
