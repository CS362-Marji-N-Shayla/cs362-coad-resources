require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { FactoryBot.build(:ticket) }
  let(:region) { FactoryBot.create(:region)}
  let(:resource_category) { FactoryBot.create(:resource_category)}
  let(:organization) { FactoryBot.create(:organization) }


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
    it "validates presence of name" do
      expect(ticket).to validate_presence_of(:name)
    end
    it 'validates length of name' do
      expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
    it 'validates length of description' do
        expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
    end
    it "validates presence of phone" do
      expect(ticket).to validate_presence_of(:phone)
    end
    it 'validates phone number' do
      ticket.region = region
      ticket.resource_category = resource_category
      expect(ticket).to be_valid
      ticket.phone = 'INVALID'
      expect(ticket).to be_invalid
    end
    it "validates presence of region_id" do
      expect(ticket).to validate_presence_of(:region_id)
    end
    it "validates presence of resource_category_id" do
      expect(ticket).to validate_presence_of(:resource_category_id)
    end

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
    it 'is open' do
      ticket.closed = false
      expect(ticket).to be_open
      expect(ticket).to_not be_closed
    end

  end

  describe '#closed' do
    it 'is closed' do
      ticket.closed = true
      expect(ticket).to be_closed
      expect(ticket).not_to be_open
    end
  end

  describe '#all_organization' do
    it 'returns all open tickets with an organization' do
      open_ticket_with_org = create(:ticket, :open, :with_organization)
      expect(Ticket.all_organization).to include(open_ticket_with_org)
      closed_ticket_with_org = create(:ticket, :closed, :with_organization)
      expect(Ticket.all_organization).not_to include(closed_ticket_with_org)
      open_ticket_without_org = create(:ticket, :open)
      expect(Ticket.all_organization).not_to include(open_ticket_without_org)
      closed_ticket_without_org = create(:ticket, :closed, :without_org)
      expect(Ticket.all_organization).not_to include(closed_ticket_without_org)
    end
  end

  # describe '#organization' do
  #   it 'is organization scope' do
  #     ticket.closed = false
  #     ticket.organization = organization.organization_id
  #     expect(ticket).to be_all_organization
  #   end
  # end
end





