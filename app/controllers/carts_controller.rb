class CartsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def index

  end

  def checkout
  	cart_products = session[:cart]
  	unless cart_products.blank?	
  	   total_price = cart_products.map {|s| s['price'].to_f * s['quntity'].to_f}.reduce(0, :+)	
  	   @order = Order.create(:user_id => current_user.id, :price => total_price)
  	   if @order.save
  	   	cart_products.each do | cp |
  	   	  ProductOrder.create(:order_id => @order.id,:product_id => cp['id'],:quantity => cp['quntity'], :price => cp['price'].to_f)	
  	   	end
  	   		session[:cart] = []
  	   		redirect_to "/orders/#{@order.id}" and return
  	   end

    end

  	respond_to do |format|
      format.html { head :no_content }
      format.json { head :no_content }
    end

  end
end
