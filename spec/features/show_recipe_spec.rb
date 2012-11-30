# encoding: utf-8

require 'spec_helper'

describe 'Show recipe page' do
  before do
    @category = FactoryGirl.create(:category)
    @second_category = FactoryGirl.create(:category)
    @recipe = FactoryGirl.create(:recipe, category_id: '1')
    @second_recipe = FactoryGirl.create(:recipe, category_id: '1')
    visit root_path
  end
  describe 'in the show recipe page' do
    before do
      click_link @category.name
      click_link @recipe.name
    end
    it 'must redirect to recipes#show' do
      current_path.should == recipe_path(@category, @recipe)
    end
    it 'must show the recipe\'s name' do
      page.should have_content(@recipe.name)
    end
    it 'must not show another recipe\'s name' do
      page.should_not have_content(@second_recipe.name)
    end
  end
end