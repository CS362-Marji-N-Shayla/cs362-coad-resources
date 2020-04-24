require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { Ticket.new }

  it 'has a string representation that is the name' do
      ticket_name = Ticket.new(name: 'FAKE')
      expect(ticket_name.to_s).to eq("Ticket #{ticket.id}"
      )
  end

  describe "relationships" do  
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

  describe "validations" do
    it "validates name" do
      expect(ticket).to validate_presence_of(:name)
    end
    it "validates length of name" do
      expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
    it "validates length of description" do
        expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
    end
  end

end





