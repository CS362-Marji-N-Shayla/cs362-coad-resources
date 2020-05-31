require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
	before :each do
        @ticket = FactoryBot.create(:ticket)
        @user = FactoryBot.create(:user, :admin)
        log_in_as(@user)
    end

    it "displays a success message" do
        visit ticket_path(@ticket)
        click_link 'Close'
        visit dashboard_url
        select 'Closed', from: 'status'
        expect(page).to have_content(@ticket.name)
    end

end
