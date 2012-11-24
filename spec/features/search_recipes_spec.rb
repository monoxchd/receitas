# encoding: utf-8
require 'spec_helper'

describe 'Search for recipes' do
  before do
    @recipe = FactoryGirl.create(:recipe, name: 'Torta de limão')
    @second_recipe = FactoryGirl.create(:recipe, name: 'Bar', description: 'foo')
    visit root_path
  end

  describe 'with query' do
    before do
      fill_in :search_field, with: 'limão'
      click_button 'Search'
    end

    it 'redirect to recipes#search' do
      current_path.should == recipe_search_path
    end

    it 'display all the matched recipes' do
      page.should have_content(@recipe.name)
      page.should_not have_content(@second_recipe.name)
    end

    it 'must display the search query' do
      page.should have_content('limão')
    end

    it 'must fill search field with query' do
      find('#search_field').value.should == 'limão'
    end
  end

  describe 'without query' do
    it 'must show an error message' do
      click_button 'Search'
      page.should have_content('Digite alguma coisa!')
    end
  end
end