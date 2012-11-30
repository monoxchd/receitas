require 'spec_helper'

describe 'routing Devise' do
  it 'routes to sessions#new' do
    get('/users/sign_in').should route_to('devise/sessions#new')
  end
  it 'routes to sessions#create' do
    post('/users/sign_in').should route_to('devise/sessions#create')
  end
  it 'routes to sessions#destroy' do
    delete('/users/sign_out').should route_to('devise/sessions#destroy')
  end
  it 'routes to passwords#create' do
    post('/users/password').should route_to('devise/passwords#create')
  end
  it 'routes to passwords#new' do
    get('/users/password/new').should route_to('devise/passwords#new')
  end
  it 'routes to passwords#edit' do
    get('/users/password/edit').should route_to('devise/passwords#edit')
  end
  it 'routes to passwords#update' do
    put('/users/password').should route_to('devise/passwords#update')
  end
  it 'routes to registrations#cancel' do
    get('/users/cancel').should route_to('devise/registrations#cancel')
  end
  it 'routes to registrations#create' do
    post('/users').should route_to('devise/registrations#create')
  end
  it 'routes to registrations#new' do
    get('/users/sign_up').should route_to('devise/registrations#new')
  end
  it 'routes to registrations#edit' do
    get('/users/edit').should route_to('devise/registrations#edit')
  end
  it 'routes to registrations#update' do
    put('/users').should route_to('devise/registrations#update')
  end
  it 'routes to registrations#destroy' do
    delete('/users').should route_to('devise/registrations#destroy')
  end
end