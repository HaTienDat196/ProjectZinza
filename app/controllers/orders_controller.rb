class OrdersController < InheritedResources::Base
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

