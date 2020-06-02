require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
	before :each do
        organization = FactoryBot.create(:organization, :approved)
        @user = FactoryBot.create(:user, organization: organization)
        @ticket = FactoryBot.create(:ticket)
        log_in_as(@user)
    end

	it "takes user to dashboard after capturing a ticket" do
      visit ticket_path(@ticket.id)
      click_on 'Capture'
      # click_on @ticket.name
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(@ticket.name)
    end
end
