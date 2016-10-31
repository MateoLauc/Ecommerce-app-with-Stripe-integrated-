class CategoriesController < ApplicationController
    helper_method :smjer
  def show
      # Pronaći ID poslane kategorije i onda iz nje izabrati proizvode
    	@category= Category.find(params[:id])
    	@variants= Variant.where(condition).order('price'+' '+ smjer).joins(:product).where(products: {category_id: @category.id})
    	#@variants=@variants.limit(16) opt
      @colors= Color.all

      respond_to do |format|
       format.js
       format.html  
      end

  end

	private
		
		def smjer
		  params[:direction] || "asc"
		end 
    
      def condition 
           @cond=""
           
           if params[:color_id] == nil 
             @cond= ""
           else 
             @cond= "color_id = #{params[:color_id]}" 
           end  
           
           if params[:priceRange] != nil
              @niz= []
              @niz=params[:priceRange].split('-');
              
              if @cond == ""
                 @cond= "price >= #{@niz[0]} AND price <= @{@niz[1]}"
              else
                 @cond=@cond + " AND (price >= #{@niz[0]} AND price <= #{@niz[1]})"
              end
           
           else   
            @cond
           end

      end 
end

