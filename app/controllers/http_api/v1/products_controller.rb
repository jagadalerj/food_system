class HttpApi::V1::ProductsController < ApplicationController
  
  def index
  	@products = Product.all
  end
end
