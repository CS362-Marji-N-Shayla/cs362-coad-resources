require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
	before :each do
        organization = FactoryBot.create(:organization, :approved)
        @user = FactoryBot.create(:user, organization: organization)
        @captured_ticket = FactoryBot.create(:ticket, organization: organization)
        log_in_as(@user)
    end
	#release ticket from dashboard
    it 'releases a ticket' do
        visit ticket_path(@captured_ticket.id)
        click_link 'Release'
        expect(page).to have_content(@captured_ticket.name)
    end
end
