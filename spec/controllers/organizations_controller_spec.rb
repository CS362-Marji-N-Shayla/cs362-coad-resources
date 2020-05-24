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
							organization: {name: 'Fake',
								email: 'fake@fake.com',
								phone: '13036531234',
								primary_name: 'Fake_primary',
								secondary_name: 'Fake_secondary',
								secondary_phone: '13036534332'
							},
						}
					)
				).to redirect_to(organization_application_submitted_path)
			end
		end
	end

end
