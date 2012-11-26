require 'spec_helper'

describe RecipesController do
  before do
    @category = FactoryGirl.create(:category)
    @recipe = FactoryGirl.create(:recipe, category_id: '1')
  end

  describe 'GET #show' do
    it 'assigns the requested recipe to @recipe' do
      get :show, category_id: @category.id, id: @recipe.id
      assigns(:recipe).should == @recipe
    end
    it 'renders the :show view' do
      get :show, category_id: @category.id, id: @recipe.id
      response.should render_template :show
    end
  end

end