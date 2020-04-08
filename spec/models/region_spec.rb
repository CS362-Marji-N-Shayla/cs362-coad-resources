require 'rails_helper'

RSpec.describe Region, type: :model do

    it 'exists' do
        Region.new
    end
    
    it 'has a string representation that is the name' do
        r = Region.new
        expect(r.to_s).to eq(r.name)
    end

end
