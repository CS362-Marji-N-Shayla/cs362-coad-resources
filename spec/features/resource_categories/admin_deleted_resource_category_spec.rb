require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
    before :each do
        @resource_category = FactoryBot.create(:resource_category)
        @user = FactoryBot.create(:user, :admin)
        log_in_as(@user)
    end

    it 'displays a success message' do
        visit resource_category_path(@resource_category)
        # visit "/resource_categories/#{@resource_category.id}"
        click_link 'Delete'
        expect(page).to have_content('Category')
        expect(page).to have_content('was deleted')
    end
end
