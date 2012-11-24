require 'spec_helper'

FactoryGirl.define do
	factory :recipe do
    category
		description { Faker::Lorem.words(5) }
		ingredients { Faker::Lorem.paragraphs(3) }
    name { Faker::Name.name }
		how_to { Faker::Lorem.paragraphs(3) }
  end
end