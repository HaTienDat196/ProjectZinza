require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { FactoryGirl.create :user }
  let!(:product) { FactoryGirl.create :product, user_id: user.id }
  let!(:product1) { FactoryGirl.create :product, user_id: user.id }
  let!(:user1) { FactoryGirl.create :user }
  let!(:user2) { FactoryGirl.create :user }
  let!(:cart1) { FactoryGirl.create :cart, user_id: user2.id }
  let!(:cart_product1) { FactoryGirl.create :cart_product, cart_id: cart1.id, product_id: product1.id }
  let!(:category) { FactoryGirl.create :category }

  describe 'GET# profile' do
    it do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user2
      get :profile
    end
  end

  describe 'GET# get_products_of_user' do
    it do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
      get :get_products_of_user
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET# get_users_bought_your_product' do
    it do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
      get :get_users_bought_your_product
      expect(response).to have_http_status(:success)
    end
  end
end
