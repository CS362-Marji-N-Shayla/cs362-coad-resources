require 'rails_helper'

RSpec.describe User, type: :model do

	it 'has a string representation that is the email' do
		user = User.new(email: 'FAKE')
		expect(user.to_s).to eq('FAKE')
	end
end

describe "relationships" do
	it "belongs to organization" do
		user = User.new
		expect(user).to belong_to(:organization)
	end
end
