FactoryBot.define do 
    factory :ticket do
        sequence :name do |n|
			"Name#{n}"
		end
        phone{ '+41 23 456 78 90' }
        trait :open do
            closed { false }
            organization_id { nil }
        end
        trait :closed do
            closed { true }
        end
        trait :with_organization do
            organization
        end
        trait :without_org do
            organization_id{ nil }
        end
        region
        resource_category
	end	
end




