require 'rails_helper'

RSpec.describe Region, type: :model do
	let(:region) { build(:region) }
	
    it 'has a string representation that is the name' do
        region = Region.new(name: 'FAKE')
        expect(region.to_s).to eq('FAKE')
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

end


