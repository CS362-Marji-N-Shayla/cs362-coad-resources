require 'rails_helper'

RSpec.describe User, type: :model do

	it 'has a string representation that is the email' do
		r = User.new(email: 'FAKE')
		expect(r.to_s).to eq('FAKE')
	end

    it 'exists' do
        User.new
    end

end
