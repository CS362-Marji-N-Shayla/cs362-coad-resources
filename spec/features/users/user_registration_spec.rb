require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

	it "creates a new user when I sign up" do
		visit signup_url
		fill_in 'Email address', with: 'fake99@fake.com'
		fill_in 'Password', with: 'FAKEPASSWORD'
		fill_in 'Password confirmation', with: 'FAKEPASSWORD'
		# check 'I\'m not a robot'
		click_button 'Sign up'
		click_on 'Confirm my account'
		expect(page).to have_content('successfully confirmed')
	end

end
