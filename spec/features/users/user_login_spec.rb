require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do

	before(:each) do
		user = FactoryBot.create(:user)
	end

	it 'moves an organization to approved when I approve it' do
		visit login
		fill_in 'Email address', with: user.email
		fill_in 'Email address', with: user.password
		click_on 'Sign in'
		expect(page).to have_content('Dashboard')
	end

end
