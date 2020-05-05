FactoryBot.define do 
	factory :ticket do
		name { 'FAKE' }
        phone{ '555-555-5555'}
        trait :open do
            closed { false }
            organization_id { nil }
        end
        trait :closed do
            closed { true }
        end
        # region
	end	
end

# FactoryBot.define do
#     factory :region do
#         id: 1    #??
#     end
# end


