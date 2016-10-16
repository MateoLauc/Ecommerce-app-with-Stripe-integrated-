class ProductsController < ApplicationController
  def new
  	@product= Product.new;
  end
  
  def create
  	@p= Product.new(params.require(:product).permit(:naziv,:opis,:cijena,:kolicina,:image))
  if @p.save
    redirect_to( :controller =>'lander' , :action => 'index')
else
	 redirect_to( :controller =>'products' , :action => 'new')
end
  end

  def products_params 
  	params.require(:product).permit(:naziv,:opis,:cijena,:kolicina,:image)
  end

  def show
  	@product=Product.find(params[:id])
  end 
end
