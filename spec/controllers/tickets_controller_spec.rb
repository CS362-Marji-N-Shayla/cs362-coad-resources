require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
	
	context 'As a non-logged in user' do

		describe 'GET #new' do
			it "gets new successfully" do
				expect(get(:new)).to be_successful
			end
		end

	end

	context 'As an organization user' do
		let(:user) { create(:user) }
		before(:each){ sign_in(user) }

		describe 'GET #new' do
			it "gets new successfully" do
				expect(get(:new)).to be_successful
			end
		end

	end

	context 'As an admin' do
		let(:admin_user) { create(:user, :admin) }
		before(:each){ sign_in(admin_user) }

		describe 'GET #new' do
			it "gets new successfully" do
				expect(get(:new)).to be_successful
			end
		end

	end
end

