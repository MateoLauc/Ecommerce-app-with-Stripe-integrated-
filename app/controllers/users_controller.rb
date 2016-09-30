class UsersController < ApplicationController
  def new
	#kreiramo novog usera kojeg prosljedjujemo u view   	
  	@korisnik= User.new; 
  end
  def create
  	#napravimo novog korisnika i dodjelimo mu sve atribute objekta kojeg dobijemo iz registraciske forme 
  	@korisnik= User.new(params[:korisnik].permit(:ime,:prezime,:email , :password , :password_confirmation), role_id: 1)
  	if @korisnik.save
      #Treba dodati provjeru postojanja emaila da bi ga mogli  logirati
      session[:user_id] = @korisnik.id
  	flash[:notice]= "Registracija uspješna"
  	flash[:color]= "valid"
    redirect_to( :controller =>'lander' , :action => 'index')
  else
  	flash[:notice]="Registracija neuspješna"
  	flash[:color] = "Invalid"
  	#Ukoliko je forma krivo popunjena ponovo vrati na tu formu
  	render "new"
  end 

  end 

  
end
