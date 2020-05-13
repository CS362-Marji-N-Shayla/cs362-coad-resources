require 'rails_helper'

RSpec.describe Organization, type: :model do
	let(:organization) { Organization.new }

  describe 'relationships' do  
    it 'has many users' do
      expect(organization).to have_many(:users)
    end
    it 'has many tickets' do
      expect(organization).to have_many(:tickets)
    end
    it "has and belongs to many resource categories" do
      expect(organization).to have_and_belong_to_many(:resource_categories)
    end
    

  end   

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
        it "responds to a status" do
            expect(organization).to respond_to(:status)
        end
        it "responds to a phone" do
            expect(organization).to respond_to(:phone)
        end
        it "responds to a email" do
            expect(organization).to respond_to(:email)
        end
        it "responds to a description" do
            expect(organization).to respond_to(:description)
        end
        it "responds to a rejection_reason" do
            expect(organization).to respond_to(:rejection_reason)
        end
        it "responds to a liability_insurance" do
            expect(organization).to respond_to(:liability_insurance)
        end
        it "responds to a primary_name" do
            expect(organization).to respond_to(:primary_name)
        end
        it "responds to a secondary_name" do
            expect(organization).to respond_to(:secondary_name)
        end
        it "responds to a secondary_phone" do
            expect(organization).to respond_to(:secondary_phone)
        end
        it "responds to a title" do
            expect(organization).to respond_to(:title)
        end
        it "responds to a transportation" do
            expect(organization).to respond_to(:transportation)
        end
    end

end