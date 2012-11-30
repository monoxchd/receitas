# encoding: utf-8

require 'spec_helper'

describe 'Recipes page' do
  before do
    @category = FactoryGirl.create(:category)
    @second_category = FactoryGirl.create(:category)
    @recipe = FactoryGirl.create(:recipe, category_id: '1')
    @second_recipe = FactoryGirl.create(:recipe, category_id: '1')
    @third_recipe = FactoryGirl.create(:recipe, category_id: '2')
    visit root_path
  end
  describe 'in the recipes page' do
    before do
      click_link @category.name
    end
    it 'must redirect do categories#show' do
      current_path.should == category_path(@category)
    end
    it 'must show all the recipes on the menu' do
      page.should have_content(@recipe.name)
      page.should have_content(@second_recipe.name)
    end
    it 'must not have any recipe not related to the category' do
      page.should_not have_content(@third_recipe.name)
    end
  end
end