require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
	# let(:region) { FactoryBot.build(:region) }
	context 'As a public user' do
		describe '/regions' do
			specify { expect(get(:index)).to redirect_to(new_user_session_path) }
		end
	end

	context 'As an organization user' do
		let(:user) { create(:user) }
		before(:each){ sign_in(user) }

		describe 'GET #index' do
			specify { expect(get(:index)).to redirect_to(dashboard_path) }
		end


	end

	context 'As an admin' do
		let(:admin_user) { create(:user, :admin) }
		before(:each){ sign_in(admin_user) }

		describe 'GET #index' do
			specify { expect(get(:index)).to be_successful }
		end

		describe 'POST #create' do
			it "it creates a region" do
				expect(post(:create)).to be_successful
			end
		end

		# describe 'GET #show' do
		# 	it "redirects to the sign in page" do
		# 		expect(get(:show, parameters: { id: region.id })).to be_successful
		# 	end
		# end
	end




end
