require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { FactoryBot.build(:ticket) }

  it 'has a string representation that is the name' do
      ticket_name = Ticket.new(name: 'FAKE')
      expect(ticket_name.to_s).to eq("Ticket #{ticket.id}"
      )
  end

  describe 'relationships' do  
    it 'belongs to organization' do
      expect(ticket).to belong_to(:organization)
    end
    
    it 'belongs to resource category' do
      expect(ticket).to belong_to(:resource_category)
    end
    
    it 'belongs to region' do
      expect(ticket).to belong_to(:region)
    end
  end

  describe 'validations' do
    it "validates name" do
      expect(ticket).to validate_presence_of(:name)
    end
    it 'validates length of name' do
      expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
    it 'validates length of description' do
        expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
    end
    # it 'validates phone number' do
    #   expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
    # end
  end

  describe 'attributes' do
    it 'responds to a name' do
        expect(ticket).to respond_to(:name)
    end
    it 'responds to a description' do
        expect(ticket).to respond_to(:description)
    end
    it 'responds to a phone' do
        expect(ticket).to respond_to(:phone)
    end
  end

  describe '#open' do
    it 'open tickets' do
      open_ticket = Ticket.new(closed: false, organization_id: nil)
      closed_ticket = Ticket.new(closed: true)
      open_tickets = Ticket.open
      expect(open_tickets).to include(open_ticket)
      expect(open_tickets).not_to include(closed_ticket)
    end
  end

  describe '#closed' do
    it 'closed tickets' do
      closed_ticket = Ticket.new(name: "Fake" phone: "555-555-5555" region_id: Region.new closed: true)
      open_ticket = Ticket.new(closed: false, organization: nil)
      closed_tickets = Ticket.closed
      expect(closed_tickets).to include(closed_ticket)
      expect(closed_tickets).not_to include(open_ticket)
    end
  end

end





