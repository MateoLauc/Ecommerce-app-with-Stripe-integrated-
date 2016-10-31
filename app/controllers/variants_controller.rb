class VariantsController < ApplicationController
  def new
  	@variant = Variant.new
  end

  def create
  	@v =Variant.new(params.require(:variant).permit(:color_id,:size_id,:product_id,:qty,:price))

   if @v.save
    redirect_to( :controller =>'lander' , :action => 'index')
else
	 redirect_to( :controller =>'variants' , :action => 'new')
end
  end

  def show
  	#definirati prikaz određene varijante proizvoda
  	#i slicnih varijanti proizvoda
  	#@product=Product.find(params[:id])
    @variant= Variant.find(params[:id])
    @product= @variant.product
	@variants= @product.variants.take(2)
  end
end
