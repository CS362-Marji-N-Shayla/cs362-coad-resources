require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
	before :each do
        @ticket = FactoryBot.create(:ticket)
        @user = FactoryBot.create(:user, :has_org)
        log_in_as(@user)
    end

	it "displays a success message" do
      visit dashboard_url
      byebug
      click_on 'Tickets'
      click_on @ticket.name
      expect(page).to have_content('Ticket Submitted')
    end
end
