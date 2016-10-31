class LanderController < ApplicationController
  def index
  		@variants=Variant.all()
  	@variants=@variants.limit(16) 
	end 
end
