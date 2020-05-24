require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do

	# before(:each) do
	# 	user = FactoryBot.create(:user)
	# 	log_in_as(user)
	# end

	it 'displays a success message' do
		visit new_organization_path
		choose 'organization_liability_insurance_true'
		choose 'organization_agreement_one_true'
		choose 'organization_agreement_two_true'
		choose 'organization_agreement_three_true'
		choose 'organization_agreement_four_true'
		choose 'organization_agreement_five_true'
		choose 'organization_agreement_six_true'
		choose 'organization_agreement_seven_true'
		choose 'organization_agreement_eight_true'
		fill_in 'What is your name? (Last, First)', with: 'Fake Name'
		fill_in 'Organization Name', with: 'FakeOrg'
		fill_in 'What is your direct phone number? Cell phone is best', with: '555-543-1234'
		fill_in 'Who may we contact regarding your organization\'s application if we are unable to reach you?', with: "Fake Secondary"
		fill_in 'What is a good secondary phone number we may reach your organization at', with: '541-123-3241'
		fill_in 'organization_email', with: 'fake@fakeemail.com'
		fill_in 'Description', with: 'Fake description'
		choose 'organization_transportation_yes'
		click_on 'Apply'
		expect(page).to have_content('Application Submitted')
	end


end
