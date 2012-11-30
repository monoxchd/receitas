require 'spec_helper'

describe 'categories/show.haml' do
  it 'display all categories recipes' do
    @category = FactoryGirl.create(:category)
    @recipe = FactoryGirl.create(:recipe, category: @category)

    render

    rendered.should include(@recipe.name)
  end
end