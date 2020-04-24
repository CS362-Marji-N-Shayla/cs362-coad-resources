require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    it 'has a string representation that is the name' do
        resource_category = ResourceCategory.new(name: 'FAKE')
        expect(resource_category.to_s).to eq('FAKE')
    end

    describe "relationships" do
        let(:resource_category) { RescourceCategory.new }
        
        it "has and belongs to many organizations" do
            expect(resource_category).to have_and_belong_to_many(:organizations)
        end
    
        it "has many tickets" do
            expect(resource_category).to have_many(:tickets)
        end
        
    end

end

