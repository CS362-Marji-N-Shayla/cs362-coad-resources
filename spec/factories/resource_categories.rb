FactoryBot.define do 
	factory :resource_category do
		sequence :name do |n|
			"Name#{n}"
		end
		active { 'true' }
	end	
    trait :inactive do
    	active { 'false' }
	end
	trait :active do
    	active { 'true' }
	end

	factory :unspecified_resource_category, class: 'ResourceCategory' do
		name { 'Unspecified' }
	end
end