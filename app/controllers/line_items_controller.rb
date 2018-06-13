class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[show edit update destroy]

  def index
    @line_items = LineItem.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    @cart = current_cart if user_signed_in?
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(product: product)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(@line_item.cart, :notice => 'Line item was successfully created') }
        format.js   { @current_item = @line_item }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if current_user.line_items.nil?
      format.html { redirect_to line_items_path, notice: ' Vui lòng kiểm tra lại danh sách sản phẩm' }
    else
      respond_to do |format|
        if @line_item.update(line_item_params)
          format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
          format.json { render :show, status: :ok, location: @line_item }
        else
          format.html { render :edit }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
      @line_item.destroy
      respond_to do |format|
        format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  private

  def set_line_item
    # if @line_items.nil?
    #   redirect_to new_cart_path
    # else
        @line_item = LineItem.find(params[:id])
    # end
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :cart_id)
  end
  private

  # def product_id
  #   if product_id.nill?
  #     errors.add(:product, 'is not valid or is not active')
  #   end
  # end
end
