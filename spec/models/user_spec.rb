require 'rails_helper'

RSpec.describe User, type: :model do
 
  let(:user) { FactoryBot.build(:user) }

	it "has a string representation that is the email" do
		expect(user.to_s).to eq("#{user.email}")
	end

	describe "relationships" do

		it "belongs to organization" do
			expect(user).to belong_to(:organization)
		end
  end
  
  describe "attributes" do

    it "responds to an email" do
        expect(user).to respond_to(:email)
    end

    it "responds to a role" do
      expect(user).to respond_to(:role)
  end
end

  describe "validations" do

    it "validates email" do
        expect(user).to validate_presence_of(:email)
    end

    it "validates password" do
        expect(user).to validate_presence_of(:password)
    end

    it "validates length of email" do
        expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
    end

    it "validates length of password" do
        expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create)
    end

    it "validates uniqueness of email" do
    	expect(user).to validate_uniqueness_of(:email).case_insensitive
    end
    
    it "validates email format" do
    	expect(user).to allow_value("email@addresse.foo").for(:email)
    	expect(user).to_not allow_value("foo").for(:email)
    end
  end

end
