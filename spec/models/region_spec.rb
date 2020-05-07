require 'rails_helper'

RSpec.describe Region, type: :model do

    let(:region) { FactoryBot.build(:region) }

    describe "#to_s" do
        it 'has a string representation that is the name' do
            expected = 'FAKE'
            region.name = expected
            expect(region.to_s).to eq('FAKE')
        end
    end

    describe "validations" do
    	it "validates name" do
    		expect(region).to validate_presence_of(:name)
    	end
    	it "validates length of name" do
    		expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    	end
    	it "validates uniqueness of name" do
    		expect(region).to validate_uniqueness_of(:name).case_insensitive
    	end
    end

    describe "attributes" do
        it "responds to a name" do
            expect(region).to respond_to(:name)
        end
    end


end


