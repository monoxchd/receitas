require 'spec_helper'

describe Admin::CategoriesController do
  before do
    @category = FactoryGirl.create(:category)
  end

  describe 'GET #index' do
    it 'populates an array of categories' do
      get :index
      assigns(:categories).should == [@category]
    end

    it 'renders the index view' do
      get :index
      response.should render_template :index
    end
  end
end