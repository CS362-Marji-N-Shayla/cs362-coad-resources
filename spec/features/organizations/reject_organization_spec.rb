require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do

	before(:each) do
		organization = FactoryBot.create(:organization)
		user = FactoryBot.create(:user, :admin)
		log_in_as(user)
	end

	it 'moves an organization to approved when I approve it' do
		visit organizations_url
		click_on 'Pending'
		click_on 'Review'
		click_on 'Reject'
		expect(page).to have_content('Rejected')
	end
end
