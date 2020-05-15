require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
	let(:region) { FactoryBot.build(:region) }
	context 'As a non-logged in user' do
		describe 'GET #index' do
			specify { expect(get(:index)).to redirect_to(new_user_session_path) }
		end
		describe 'POST #create' do
			specify { expect(post(:create)).to redirect_to(new_user_session_path) }
		end
		describe 'GET #show' do
			it "redirects to the sign in page" do
				expect(get(:show, params: { id: 'FAKE' })).to redirect_to(new_user_session_path)
			end
		end
		describe 'GET #new' do
			it "redirects to the sign in page" do
				expect(get(:new)).to redirect_to(new_user_session_path)
			end
		end
		specify 'GET #edit' do
        	region = create(:region)
        	expect(get(:edit, params: {id: region.id})).to redirect_to(new_user_session_path)
    	end
	end

	context 'As an organization user' do
		let(:user) { create(:user) }
		before(:each){ sign_in(user) }

		describe 'GET #index' do
			specify { expect(get(:index)).to redirect_to(dashboard_path) }
		end

		describe 'GET #show' do
			it "redirects to the sign in page" do
				expect(get(:show, params: { id: 'FAKE' })).to redirect_to(dashboard_path)
			end
		end

	end

	context 'As an admin' do
		let(:admin_user) { create(:user, :admin) }
		before(:each){ sign_in(admin_user) }

		# before do
		# 	sign_in(admin)
		# end

		describe 'GET #index' do
			specify { expect(get(:index)).to be_successful }
		end

		# describe 'GET #show' do
		# 	it "redirects to the sign in page" do
		# 		expect(get(:show, params: { id: region.id })).to be_successful
		# 	end
		# end

		describe 'GET #new' do
			it "redirects to the sign in page" do
				expect(get(:new)).to be_successful
			end
		end

		# describe 'GET #edit' do
		# 	region = create(:region)
		# 	it "redirects to the sign in page" do
		# 		expect(get(:edit, parameters: { id: region.id })).to be_successful
		# 	end
		# end

		# describe 'POST #create' do
		# 	it "it creates a region" do
		# 		specify { expect(post(:create, parameteres: {region: attributes_for(:region))).to redirect_to(regions_path) }
		# 	end
		# end

		# describe 'DELETE #destroy' do
		# 	region = create(:region)
		# 	it "it creates a region" do
		# 		specify { expect(delete(:destroy)).to redirect_to(regions_path) }
		# 	end
		# end

		# describe 'PUT #update' do
		# 	region = create(:region)
		# 	it "it creates a region" do
		# 		specify { expect(put(:update, parameters: { id: region.id, region: attributes_for (region) })).to redirect_to(region_path(region)) }
		# 	end
		# end

	end
end
