FactoryBot.define do 
	factory :region do
		sequence :name do |n|
			"Name#{n}"
		end
	end

	factory :unspecified_region, class: 'Region' do
		name { 'Unspecified'}
	end	
	
end