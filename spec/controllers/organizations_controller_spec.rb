require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

	class FakeMailer
		def new_organization_application
			false
		end
	end	

	context 'Organization user' do
		describe 'POST #create' do
			let(:user) do
				User.create(email: 'fake@fake.com', password: 'password',
					password_confirmation: 'password', role: 'organization')
			end
			before do
				user.confirm
				sign_in(user)
			end
			it 'succeeds' do
				allow(UserMailer).to receive(:with).and_return(FakeMailer.new)
				expect(
					post(
						:create, 
						params: {
							organization: attributes_for(:organization)
						}
					)
				).to redirect_to(organization_application_submitted_path)
			end
		end
	end

end
