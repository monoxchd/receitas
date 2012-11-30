# encoding: utf-8

require 'spec_helper'

describe 'User creation' do
  before do
    visit root_path
  end

  describe 'Register a user' do
    context 'valid user' do
      it 'must register a valid user' do
        click_link 'Sign up'
        fill_in :user_name, with: 'Denis'
        fill_in :user_last_name, with: 'Junior'
        fill_in :user_login, with: 'Monoxchd'
        find('.email').set 'dneves.junior@gmail.com'
        find('.password').set 'teste'
        find('.password_confirmation').set 'teste'
        click_button 'Sign up'
      end
    end
    context 'invalid user' do
      it 'must not register a inTvalid user' do
        click_link 'Sign up'
        fill_in :user_last_name, with: 'Junior'
        fill_in :user_login, with: 'Monoxchd'
        find('.email').set 'dneves.junior@gmail.com'
        find('.password').set 'teste'
        find('.password_confirmation').set 'teste'
        click_button 'Sign up'
        p current_path
      end
    end
  end
end