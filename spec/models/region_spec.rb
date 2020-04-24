require 'rails_helper'

RSpec.describe Region, type: :model do
    
    it 'has a string representation that is the name' do
        region = Region.new(name: 'FAKE')
        expect(region.to_s).to eq('FAKE')
    end

end
