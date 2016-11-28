class AddressesController < ApplicationController

	def new 
		#ovdje ide dobabavljanje adresa..ako ih je bilo prije
		 @suma= session[:suma].to_f
	end 

	def create 
		#ovdje ide provjera sta je odabranoo. ne spremanje ako treba spremat nove akcije.. 
		#korisnik mora biti prijavljen
		@adresaRacun= Address.new(params[:addresses][0], :user_id => session[:user_id])
		redirect_to( :controller =>'lander' , :action => 'index')
	end

end 	