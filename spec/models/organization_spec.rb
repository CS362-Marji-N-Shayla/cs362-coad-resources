require 'rails_helper'

RSpec.describe Organization, type: :model do
	let(:organization) { Organization.new }

  describe "validations" do
    it "validates email" do
        expect(organization).to validate_presence_of(:email)
    end
    it "validates name" do
        expect(organization).to validate_presence_of(:name)
    end
    it "validates phone" do
        expect(organization).to validate_presence_of(:phone)
    end
    it "validates status" do
        expect(organization).to validate_presence_of(:status)
    end
    it "validates primary_name" do
        expect(organization).to validate_presence_of(:primary_name)
    end
    it "validates secondary_name" do
        expect(organization).to validate_presence_of(:secondary_name)
    end
    it "validates secondary_phone" do
        expect(organization).to validate_presence_of(:secondary_phone)
    end 
    it "validates length of email" do
        expect(organization).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
    end
    it "validates length of name" do
        expect(organization).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
    it "validates length of description" do
        expect(organization).to validate_length_of(:description).is_at_most(1020).on(:create)
    end
    it "validates uniqueness of email" do
    	expect(organization).to validate_uniqueness_of(:email).case_insensitive
    end
    it "validates uniqueness of name" do
    	expect(organization).to validate_uniqueness_of(:name).case_insensitive
    end
    it "validates email format" do
    	expect(organization).to allow_value("email@addresse.foo").for(:email)
    	expect(organization).to_not allow_value("foo").for(:email)
    end
  end

  describe "attributes" do
        it "responds to a name" do
            expect(organization).to respond_to(:name)
        end
    end

end