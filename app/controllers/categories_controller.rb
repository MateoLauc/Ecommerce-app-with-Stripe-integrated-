class CategoriesController < ApplicationController
  def show
  	# Pronaći ID poslane kategorije i onda iz nje izabrati proizvode
  	@category= Category.find(params[:id])
  	@products=@category.products
  end
end
