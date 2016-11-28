class AddressesController < ApplicationController

	def new 
		#ovdje ide dobabavljanje adresa..ako ih je bilo prije
		 @adrese= Address.where(user_id: current_user.id)
		 @suma= session[:suma].to_f

	end 

	def create 
		@adresaRacun= kreirajAdresu(0)
		@adresaRacun.save
		#id-ove od addresa pohraniti u sessino[]
		session[:adresaRacun]=  @adresaRacun.id;
		if params[:adresa]= 1
			session[:adresaDostava]= @adresaRacun.id;
		else
		@adresaDostava= kreirajAdresu(1)
		@adresaDostava.save
		session[:adresaDostava]= @adresaDostava.id;
		end
		# nakon sto se spreme adrese i uradi sve potrebno.. 
		#preusmjeravamo  na NewOrder view.. gdje se plaća narudzba..
		#tako da u create imamo potrebne podatke iz tokena za plaćanje 
		redirect_to :controller => "orders", :action => "new"
	end


	def kreirajAdresu adresa
		#korisnik mora biti prijavljen prije kreirana adrese
		Address.new(:imeprezime => params[:addresses][adresa][:imeprezime],
			:naziv => params[:addresses][adresa][:naziv],
			:city => params[:addresses][adresa][:city],
			:regija => params[:addresses][adresa][:regija],
			:zip => params[:addresses][adresa][:zip],
			:country_id => params[:addresses][adresa][:country_id] ,
			:user_id => session[:user_id]
		)
	end


end 	