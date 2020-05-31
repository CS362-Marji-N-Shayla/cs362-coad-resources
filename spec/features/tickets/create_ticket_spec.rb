require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do
		before :each do
      @region = FactoryBot.create(:region)
      @resource_category = FactoryBot.create(:resource_category)
    end

    it "displays a success message" do
      visit new_ticket_path
      fill_in 'Full Name', with: 'Fakey'
      fill_in 'Phone Number', with: '541-345-3456'
      select @region.name, from: 'Region'
      select @resource_category.name, from: 'Resource Category'
      fill_in 'Description', with: 'Beans'
      click_on 'Send this help request'
      expect(page).to have_content('Ticket Submitted')
    end

end
