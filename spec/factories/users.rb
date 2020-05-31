FactoryBot.define do 
	factory :user do
		sequence :email do |n|
			"FAKE#{n}@fake.com"
		end
		password { 'FAKEPASSWORD' }

		trait :admin do
			role { 'admin' }
		end
		trait :has_org do
			organization
		end

		after :create do |user|
			user.confirm
		end
	end	
end