class CartsController < ApplicationController
  

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  def show
   @cart= current_cart
   puts session[:cart_id]
   @line_items= LineItem.where(cart_id: @cart.id).joins(variant: :product,variant: :size,variant: :color)
   @suma=@line_items.sum("variants.price* line_items.qty");
  # @line_items.each do |li|
  #@suma+= li.product.
  
  end

end
