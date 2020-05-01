require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { Ticket.new }

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

    describe "#active" do
    it "active resource_categories" do
      active_resource_category = ResourceCategory.create(active: true, name: 'FAKEACTIVE')
      inactive_resource_category = ResourceCategory.create(active: false, name: 'FAKEINACTIVE')

      active_resource_categories = ResourceCategory.active
      expect(active_resource_categories).to include(active_resource_category)
      expect(active_resource_categories).not_to include(inactive_resource_category)
    end
  end

  describe "#inactive" do
    it "inactive resource_categories" do
      active_resource_category = ResourceCategory.create(active: true, name: 'FAKEACTIVE')
      inactive_resource_category = ResourceCategory.create(active: false, name: 'FAKEINACTIVE')

      inactive_resource_categories = ResourceCategory.inactive
      expect(inactive_resource_categories).to include(inactive_resource_category)
      expect(inactive_resource_categories).not_to include(active_resource_category)
    end
  end

end





