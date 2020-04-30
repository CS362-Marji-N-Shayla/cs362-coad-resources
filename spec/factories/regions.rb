FactoryBot.define do 
	factory :region do
		name { 'FAKE' }

		trait :unspecififed do
			name { 'Unspecified'}
		end
	end	
end