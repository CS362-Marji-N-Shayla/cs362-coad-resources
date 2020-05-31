require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
	#create a ticket
	@ticket = FactoryBot.create(:ticket :captured)

	#sign in as org user of an approved org
	@user = FactoryBot.create(:user, :organization)
	log_in_as(@user)

	#create ticket with captured state
	#release ticket from dashboard
end
