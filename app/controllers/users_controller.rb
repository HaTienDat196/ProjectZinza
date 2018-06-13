class UsersController < ApplicationController
  before_action :authenticate_user!

  def get_users_bought_your_product; end

  def get_products_of_user
    @products = current_user.products
  end

  def profile; end
end

