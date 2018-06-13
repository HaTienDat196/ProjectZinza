class OrdersController < InheritedResources::Base
  def order
    if params[:id].present?
      @cart = Cart.find_by(id: params[:id])
    else
      if current_user.cart.present?
        session[:cart].each do |arr_cart|
          check = 0
          current_user.cart.cart_products.each do |product_cart|
            if arr_cart['product_id'].to_i.eql? product_cart.product_id
              product_cart.update(quantity: product_cart.quantity + arr_cart['quantity'])
              check = 1
            end
          end
          current_user.cart.cart_products.create(product_id: arr_cart['product_id'], quantity: arr_cart['quantity']) if check.zero?
        end
      else
        cart = current_user.create_cart
        session[:cart].each do |arr_cart|
          cart.cart_products.create(product_id: arr_cart['product_id'], quantity: arr_cart['quantity'])
        end
      end
      @cart = current_user.cart
    end
    session.delete(:cart)
  end

  def new
    @cart = current_cart
    if @cart.line_items.empty?
        redirect_to '/', :notice => 'Your cart is empty'
        return
    end

    @order = Order.new
  end
  private

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
end

