require 'spec_helper'

describe 'Recipe' do

	it 'must have a valid factory' do
		FactoryGirl.create(:recipe).should be_valid
	end

	it 'must have a name' do
		FactoryGirl.build(:recipe, name: nil).should_not be_valid
	end

	it 'must not have a duplicated name' do
		recipe = FactoryGirl.create(:recipe)
		second_recipe = FactoryGirl.build(:recipe, name: recipe.name)
		second_recipe.should_not be_valid
	end

	it 'must have a description' do
		FactoryGirl.build(:recipe, description: nil).should_not be_valid
	end

	it 'must have a category' do
		FactoryGirl.build(:recipe, category: nil).should_not be_valid
	end

	it 'must have an ingredients section filled' do
		FactoryGirl.build(:recipe, ingredients: nil).should_not be_valid
	end

	it 'must have a how to section filled' do
		FactoryGirl.build(:recipe, how_to: nil).should_not be_valid
	end

	it 'must have a slug' do
		recipe = FactoryGirl.create(:recipe, slug: nil)
		recipe.slug.should_not be_empty
	end

	it 'must have a treated slug with the same description as name' do
		recipe = FactoryGirl.create(:recipe, name: 'Testing Slug Attribute')
		recipe.slug.should == "testing-slug-attribute"
	end

end