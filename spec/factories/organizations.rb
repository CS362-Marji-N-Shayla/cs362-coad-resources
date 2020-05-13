FactoryBot.define do 
	factory :organization do
		sequence :name do |n|
			"Name#{n}"
		end
		sequence :email do |n|
			"FAKE#{n}@fake.com"
		end
		phone{ '+41 23 456 78 90' }
		status{ 'submitted' }
		primary_name{ 'FAKE PRIMARY' }
		secondary_name{ 'FAKE SECONDARY' }
		secondary_phone{ '+41 23 456 78 91' }
	end	
	trait :approved do
		status { 'approved' }
	end
	trait :rejected do
		status { 'rejected' }
	end
end