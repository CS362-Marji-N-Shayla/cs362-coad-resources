require 'rails_helper'

RSpec.describe Ticket, type: :model do

    it 'has a string representation that is the name' do
        ticket = Ticket.new(name: 'FAKE')
        expect(ticket.to_s).to eq("Ticket #{ticket.id}"
        )
    end

end

describe "relationships" do
    let(:ticket) { Ticket.new }

	it "belongs to organization" do
		expect(ticket).to belong_to(:organization)
    end
    
    it "belongs to resource category" do
		expect(ticket).to belong_to(:resource_category)
    end
    
    it "belongs to region" do
		expect(ticket).to belong_to(:region)
	end
end



