FactoryBot.define do 
	factory :user do
		sequence :email do |n|
			"FAKE#{n}@fake.com"
		end
		password { 'FAKEPASSWORD' }

		trait :admin do
			role { 'admin' }
		end

		after :create do |user|
			user.confirm
		end
	end	
end