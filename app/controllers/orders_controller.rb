class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  	 @order_histories = current_user.orders
  end

  def show
  	@order = Order.find(params[:id])
  	@order_products = @order.product_orders 
  end
end
