require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
    let(:user) { create(:user) }
	context 'As a non-logged in user' do
		specify 'GET #index' do
			expect(get(:index)).to redirect_to(new_user_session_path)
        end
    end

    context 'As an organization' do
        before do   
            sign_in(user)
        end

		specify 'GET #index' do
			expect(get(:index)).to be_successful
        end
    end
end

