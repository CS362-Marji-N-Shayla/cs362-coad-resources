FactoryBot.define do 
	factory :resource_category do
		sequence :name do |n|
			"Name#{n}"
		end
		active { 'true' }
	end	
end