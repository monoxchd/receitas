require 'spec_helper'

describe CategoriesController do
  before do
    @category = FactoryGirl.create(:category)
  end

  describe 'GET #index' do
    it 'populates an array of categories' do
      get :index
      assigns(:categories).should == [@category]
    end

    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested category to @category' do
      get :show, id: @category.id
      assigns(:category).should == @category
    end

    it 'renders the :show view' do
      get :show, id: @category.id
      response.should render_template :show
    end
  end
end