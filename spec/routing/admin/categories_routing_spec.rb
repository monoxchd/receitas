require 'spec_helper'

describe 'routing Admin::Categories' do
  it 'routes to #index' do
    get('/admin/categories').should route_to('admin/categories#index')
  end
  it 'routes to #create' do
    post('/admin/categories').should route_to('admin/categories#create')
  end
  it 'routes to #new' do
    get('/admin/categories/new').should route_to('admin/categories#new')
  end
  it 'routes to #edit' do
    get('/admin/categories/peixes/edit').should route_to('admin/categories#edit', id: 'peixes')
  end
  it 'routes to #show' do
    get('/admin/categories/peixes').should route_to('admin/categories#show', id: 'peixes')
  end
  it 'routes to #update' do
    put('/admin/categories/peixes').should route_to('admin/categories#update', id: 'peixes')
  end
  it 'routes to #destroy' do
    delete('/admin/categories/peixes').should route_to('admin/categories#destroy', id: 'peixes')
  end
end