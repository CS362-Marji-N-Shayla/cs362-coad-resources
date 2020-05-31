require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do

	before(:each) do
		@user = FactoryBot.create(:user)
	end

	it "logs user in when I fill in their credentials" do
		visit login_url
		fill_in 'Email address', with: @user.email
		fill_in 'Password', with: 'FAKEPASSWORD'
		click_on 'Sign in'
		expect(page).to have_content('Dashboard')
	end

end
