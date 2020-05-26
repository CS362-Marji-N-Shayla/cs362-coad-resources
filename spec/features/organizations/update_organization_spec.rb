require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do

	before(:each) do
		organization = FactoryBot.create(:organization, :approved)
		user = FactoryBot.create(:user)
		organization.users << user
		log_in_as(user)
		
	end

	it 'does something once it works correctly' do
		visit dashboard_url
		click_on 'Edit Organization'
		fill_in 'Name', with: 'newfake'
		click_on 'Update Resource'
		#Email field is a counter?
		#Update Resource button doesn't do anything
	end

end
