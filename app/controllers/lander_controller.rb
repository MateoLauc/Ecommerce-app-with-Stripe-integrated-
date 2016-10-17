class LanderController < ApplicationController
  def index
  	@products = Product.take(16)
	end 
end
