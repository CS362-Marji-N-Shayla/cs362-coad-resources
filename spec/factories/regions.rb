FactoryBot.define do 
	factory :region do
		sequence :name do |n|
			"Name#{n}"
		end
		sequence :region_id do |n|
			"#{n}"
		end
		# trait :unspecified do
		# 	name { 'Unspecified'}
		# end
	end	
end