require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    let(:resource_category) { ResourceCategory.new }

    it 'has a string representation that is the name' do
        expected_name = 'FAKE'
        resource_cat = ResourceCategory.new(name: 'FAKE')
        expect(resource_cat.to_s).to eq(expected_name)
    end

    describe "relationships" do
      it "has and belongs to many organizations" do
          expect(resource_category).to have_and_belong_to_many(:organizations)
      end
  
      it "has many tickets" do
          expect(resource_category).to have_many(:tickets)
      end
    end

    describe "validations" do
        it "validates name" do
            expect(resource_category).to validate_presence_of(:name)
        end
        it "validates length of name" do
            expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
        end
        it "validates uniqueness of name" do
            expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
        end
    end

    describe "attributes" do
        it "responds to a name" do
            expect(resource_category).to respond_to(:name)
        end
        it "responds to active" do
            expect(resource_category).to respond_to(:active)
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

    describe "#inactive?" do
      it 'can determine a resource category is inactive' do
          inactive_resource_cat = ResourceCategory.new(active: false, name: 'FAKE')
          expect(inactive_resource_cat.inactive?).to be_truthy
      end
      it 'can determine a resource category is not inactive' do
          active_resource_cat = ResourceCategory.new(active: true, name: 'FAKE')
          expect(active_resource_cat.inactive?).to be_falsey
      end
    end

    describe "::unspecified" do
        it "creates a new Unspecifeid resource category when one does not exist" do
          expect(ResourceCategory.where(name: 'Unspecified')).to be_empty
          expect{ ResourceCategory.unspecified }.to change { ResourceCategory.count }
        end
        it "does no create a new Unspecified resource category when one exists" do
          create(:unspecified_resource_category)
          expect{ ResourceCategory.unspecified }.to_not change { ResourceCategory.count }
        end
    end

    describe "#activate" do
      it "updates active status to true" do
        inactive_resource_cat = create(:resource_category, :inactive)
        expect{ inactive_resource_cat.activate }.to change { inactive_resource_cat.active }
      end
      it "doesn't update active status if already true" do
        active_resource_cat = create(:resource_category)
        expect{ active_resource_cat.activate }.to_not change { active_resource_cat.active }
      end
    end

    describe "#deactivate" do
      it "updates active status to false" do
        active_resource_cat = create(:resource_category)
        expect{ active_resource_cat.deactivate }.to change { active_resource_cat.active }
      end
      it "doesn't update active status if already false" do
        inactive_resource_cat = create(:resource_category, :inactive)
        expect{ inactive_resource_cat.deactivate }.to_not change { inactive_resource_cat.active }
      end
    end

end