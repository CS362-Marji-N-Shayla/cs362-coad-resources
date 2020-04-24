require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    let(:resource_category) { RescourceCategory.new }

    it 'has a string representation that is the name' do
        expected = 'FAKE'
        resource_cat = ResourceCategory.new(name: 'FAKE')
        expect(resource_cat.to_s).to eq(name: expected)
    end

    describe "relationships" do        
        it "has and belongs to many organizations" do
            expect(resource_category).to have_and_belong_to_many(:organizations)
        end
    
        it "has many tickets" do
            expect(resource_category).to have_many(:tickets)
        end
    end

    describe "validations" do
        it "validates name" do
            expect(resource_category).to validate_presence_of(:name)
        end
        it "validates length of name" do
            expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
        end
        it "validates uniqueness of name" do
            expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
        end
    end

end

