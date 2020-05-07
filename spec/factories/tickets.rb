FactoryBot.define do 
	factory :ticket do
		name { 'FAKE' }
        phone{ '+41 23 456 78 90' }
        trait :open do
            closed { false }
            organization_id { nil }
        end
        trait :closed do
            closed { true }
        end
	end	
end




