require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
    before :each do
        @resource_category = FactoryBot.create(:resource_category)
        @user = FactoryBot.create(:user, :admin)
    end

    it 'displays a success message' do
        visit "/resource_categories/#{@resource_category.id}"
        click_link 'Delete'
        expect(page).to have_content('Category Fake was deleted')
    end
end


# Category Fake was deleted