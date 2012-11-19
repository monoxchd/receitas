require 'spec_helper'

describe 'Recipe' do
	
	it 'must have a name' do
		recipe = FactoryGirl.build(:recipe, name: nil).should_not be_valid
	end

	it 'must not have a duplicated name' do
		recipe = FactoryGirl.build(:recipe)
	end

	it 'must have a description' do
		recipe = FactoryGirl.build(:recipe, description: nil)
	end

	it 'must have an ingredients section filled' do
		recipe = FactoryGirl.build(:recipe, ingredients: nil)
	end

	it 'must have a how to section filled' do
		recipe = FactoryGirl.build(:recipe, how_to: nil)
	end

	it 'must have a slug' do
		recipe = FactoryGirl.build(:recipe, slug: nil)
	end

	it 'must have a treated slug with the same description as name' do

	end

end