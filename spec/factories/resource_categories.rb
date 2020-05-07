FactoryBot.define do 
	factory :resource_category do
		name { 'FAKE' }
		active { 'true' }
		sequence :resource_category_id do |n|
			"#{n}"
		end
	end	
end