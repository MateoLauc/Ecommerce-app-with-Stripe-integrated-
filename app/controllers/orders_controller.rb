class OrdersController < ApplicationController
  def new
  	@adresa=session[:adresaDostava]
    
   @cart= current_cart
   puts session[:cart_id]
   @line_items= LineItem.where(cart_id: @cart.id).joins(variant: :product,variant: :size,variant: :color)
  end

  def create
  	@order=Order.new(:shippingAddress_id => session[:adresaDostava],:billingAddress_id =>session[:adresaRacun] )
  	@order.save
  	# pokupiti adrese iz sessiona i spremiti narudzbu.. 
  @id= 	@order.id 
  end

  def show
  end
end
