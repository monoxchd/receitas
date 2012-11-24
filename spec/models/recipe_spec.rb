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
		pending
		recipe = FactoryGirl.build(:recipe, description: nil)
	end

	it 'must have a category' do
		FactoryGirl.build(:recipe, category: nil).should_not be_valid
	end

	it 'must have an ingredients section filled' do
		pending
		recipe = FactoryGirl.build(:recipe, ingredients: nil)
	end

	it 'must have a how to section filled' do
		pending
		recipe = FactoryGirl.build(:recipe, how_to: nil)
	end

	it 'must have a slug' do
		pending
		recipe = FactoryGirl.build(:recipe, slug: nil)
	end

	it 'must have a treated slug with the same description as name' do
	end

end