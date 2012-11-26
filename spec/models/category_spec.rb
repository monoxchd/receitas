require 'spec_helper'

describe 'Category' do

  it 'must be a valid factory' do
    FactoryGirl.create(:category).should be_valid
  end

	it 'must have a name' do
    FactoryGirl.build(:category, name: nil).should_not be_valid
	end

	it 'must not have a duplicated name' do
    first_category = FactoryGirl.create(:category)
    second_category = FactoryGirl.build(:category, name: first_category.name)
    second_category.should_not be_valid
	end

	it 'must have a slug' do
    category = FactoryGirl.create(:category, slug: nil)
    category.slug.should_not be_empty
	end

end