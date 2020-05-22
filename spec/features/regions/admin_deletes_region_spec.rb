require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
    before :each do
        @region = FactoryBot.create(:region)
        @user = FactoryBot.create(:user, :admin)
    end

    before do
        log_in_as(@user)
    end

    context 'as an admin' do
        it 'deletes a region' do
            visit region_path(@region)
            byebug
            click_on 'Delete'
            expect(page).to have_content('Regions')
            expect(page).to have_content('was deleted')
        end
    end
end
