require 'spec_helper'

describe 'routing Admin::Recipes' do
  it 'routes to #index' do
    get('/admin/recipes').should route_to('admin/recipes#index')
  end
  it 'routes to #create' do
    post('/admin/recipes').should route_to('admin/recipes#create')
  end
  it 'routes to #new' do
    get('/admin/recipes/new').should route_to('admin/recipes#new')
  end
  it 'routes to #edit' do
    get('/admin/recipes/torta-de-limao/edit').should route_to('admin/recipes#edit', id: 'torta-de-limao')
  end
  it 'routes to #update' do
    put('/admin/recipes/torta-de-limao').should route_to('admin/recipes#update', id: 'torta-de-limao')
  end
  it 'routes to #destroy' do
    delete('/admin/recipes/torta-de-limao').should route_to('admin/recipes#destroy', id: 'torta-de-limao')
  end
end