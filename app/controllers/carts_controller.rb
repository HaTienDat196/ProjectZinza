class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]

  def index
    @carts = Cart.all
  end

  def show; end

  def new
    @cart = Cart.new
  end

  def edit; end

  def create
    if user_signed_in?
      if current_user.cart.nil?
        redirect_to product_path, notice: 'Vui lòng chọn lại sản phẩm'
      else
        @cart = Cart.new(cart_params)
        respond_to do |format|
          if @cart.save
            format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
            format.json { render :show, status: :created, location: @cart }
          else
            format.html { render :new }
            format.json { render json: @cart.errors, status: :unprocessable_entity }
          end
      end
    end
    # else
    #   redirect_to admin_user_path, notice: 'Vui lòng đăng nhập'
    end
  end
  def update
    if current_user.cart.nil?
      redirect_to product_path, notice: 'Vui lòng chọn lại sản phẩm'
    else
      respond_to do |format|
        if @cart.update(cart_params)
          format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
          format.json { render :show, status: :ok, location: @cart }
        else
          format.html { render :edit }
          format.json { render json: @cart.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    if current_user.cart.nil?
      redirect_to product_path, notice: 'Vui lòng chọn lại sản phẩm'
    else
      @cart = current_cart
      @cart.destroy
      session[:cart_id] = nil
      respond_to do |format|
        format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_cart
    @cart = Cart.find_by(id: params[:id])
  end

  def cart_params
    params.fetch(:cart, {})
  end
end
