class CategoriesController < ApplicationController
    helper_method :smjer
  def show
      # Pronaći ID poslane kategorije i onda iz nje izabrati proizvode
    	@category= Category.find(params[:id])
      query = QueryBuilder.build(params)
    	@variants= Variant.joins(:size).where(query).order('price'+' '+ smjer).joins(:product).where(products: {category_id: @category.id})
    	#@variants=@variants.limit(16) opt
      @colors= Color.all

      respond_to do |format|
       format.js
       format.html  
      end

  end

	private
		
		def smjer
		  params[:cijena] || "asc"
		end 
    
      # def condition 
      #      @cond=""
           
      #      if params[:color_id] == nil 
      #        @cond= ""
      #      else 
      #        @cond= "color_id = #{params[:color_id]}" 
      #      end  
           
      #      if params[:priceRange] != nil
      #         @niz= []
      #         @niz=params[:priceRange].split('-');
              
      #         if @cond == ""
      #            @cond= "price >= #{@niz[0]} AND price <= @{@niz[1]}"
      #         else
      #            @cond=@cond + " AND (price >= #{@niz[0]} AND price <= #{@niz[1]})"
      #         end
           
      #      else   
      #       @cond
      #      end

      # end 


      class QueryBuilder
        FILTERS = [:priceRange, :color_id, :sizeRange ]
        def self.build(parameters)
            query = []
            FILTERS.each do |filter|
              query << QueryBuilder.send(filter, parameters[filter])
            end

            if(query[0] != nil || query[1] != nil)
             query.join(' AND ')
            else
              ""
            end 
        end

        def self.priceRange range
            if(range!= nil)
            prices = range.split('-')
            "price >= #{prices[0]} AND price <= #{prices[1]}"
            else 
              nil
            end 
        end

        def self.color_id color
            if(color!= nil)
            "color_id = #{color}"
            else
             nil 
            end 
        end

        def self.sizeRange range 
          if(range!= nil)
            sizes = range.split('-')
            "size >= #{sizes[0]} AND size <= #{sizes[1]}"
            else 
              nil
            end 
        end 

      end
end

