require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
	#create a ticket
	@user = FactoryBot.create(:user, :org)

	#sign in as org user of an approved org
	#create ticket with captured state
	#release ticket from dashboard
end
