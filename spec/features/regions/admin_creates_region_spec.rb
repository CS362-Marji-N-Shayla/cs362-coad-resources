require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
    before :each do
        @region = FactoryBot.create(:region)
        @user = FactoryBot.create(:user, :admin)
        log_in_as(@user)
    end

    context 'as an admin' do
        it 'adds a region' do
            visit new_region_path
            fill_in 'Name', with: 'Fake Name'
            click_on 'Add Region'
            expect(page).to have_content('Regions')
            expect(page).to have_content('Fake Name')
        end
    end
end
