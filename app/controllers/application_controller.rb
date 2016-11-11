class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_cart

 def current_cart
 		cart=nil
		cart=Cart.find(session[:cart_id])
		if(cart!=nil)
			return cart
		end	
		rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id

		cart
  end
	
  def current_user
	  @current_user ||= User.find(session[:user_id]) if(session[:user_id])
  end

 

	before_filter :get_categories
	protected

	def get_categories
	  @categories = Category.take(4)
	end
end
