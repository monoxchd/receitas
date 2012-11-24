require 'spec_helper'

FactoryGirl.define do
  factory :category do
    name { Faker::Name.name }
  end
end