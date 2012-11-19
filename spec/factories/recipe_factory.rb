require 'factory_girl'
require 'ffaker'

FactoryGirl.define do 
	factory :recipe do
		name { Faker::Name.name }
		description {Faker::Lorem.words(5)}
		ingredients {Faker::Lorem.paragraphs(3)}
		how_to {Faker::Lorem.paragraphs(3)}

	
end