FactoryBot.define do 

	sequence :email do |n|
		"fake#{n}@example.com"
	end
	
end