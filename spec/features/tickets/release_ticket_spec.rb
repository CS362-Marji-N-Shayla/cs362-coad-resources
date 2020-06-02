require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
	before :each do
        @captured_ticket = FactoryBot.create(:ticket, :captured)
        @user = FactoryBot.create(:user)
        log_in_as(@user)
    end
	#release ticket from dashboard
    it 'releases a ticket' do
        visit ticket_path(@captured_ticket)
        click_link 'Release'
        visit dashboard_url
        select 'Released', from: 'status'
        expect(page).to have_content(@captured_ticket.name)
    end
end
