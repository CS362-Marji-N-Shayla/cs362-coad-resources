require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { FactoryBot.build(:ticket) }
  let(:region) { FactoryBot.build(:region)}
  let(:resource_category) { FactoryBot.build(:resource_category)}


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
    it 'validates phone number' do
      ticket.region_id = region.region_id
      ticket.resource_category_id = resource_category.resource_category_id
      expect(ticket).to be_valid
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

end





