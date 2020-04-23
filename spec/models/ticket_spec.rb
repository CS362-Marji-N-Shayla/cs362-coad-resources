require 'rails_helper'

RSpec.describe Ticket, type: :model do

    it 'exists' do
        Ticket.new
    end

    #{id}

    it 'has a string representation that is the name' do
        r = Ticket.new(name: 'FAKE')
        expect(r.to_s).to eq("Ticket #{r.id}"
        )
    end

end

describe "relationships" do
	it "belongs to organization" do
		ticket = Ticket.new
		expect(ticket).to belong_to(:organization)
    end
    
    it "belongs to resource category" do
		ticket = Ticket.new
		expect(ticket).to belong_to(:resource_category)
    end
    
    it "belongs to region" do
		ticket = Ticket.new
		expect(ticket).to belong_to(:region)
	end
end



