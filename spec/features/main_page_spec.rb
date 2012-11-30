# encoding: utf-8

require 'spec_helper'

describe 'Index page' do
  before do
    @category = FactoryGirl.create(:category)
    @second_category = FactoryGirl.create(:category)
    visit root_path
  end
  describe 'in the main page' do
    it 'must redirect to categories#index' do
      current_path.should == root_path
    end
    it 'must show the categories menu' do
      page.should have_content(@category.name)
      page.should have_content(@second_category.name)
    end
  end
end