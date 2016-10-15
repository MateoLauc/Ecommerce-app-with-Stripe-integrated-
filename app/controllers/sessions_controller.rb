class SessionsController < ApplicationController
    
    def login 
    	#login forma 
    end 

    def login_attempt
  	# ovdje se radi autentifikacija korisnika
   authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
      if authorized_user
        session[:user_id] = authorized_user.id; 
        redirect_to( :controller =>'lander' , :action => 'index')
      else  
        flash[:notice] = "Invalid Username or Password"
        flash[:color]= "invalid"
        #Ukoliko se ne autorizira korisnik ponovo ga vratimo na login_formu
        redirect_to( :controller =>'sessions' , :action => 'login')	
        end
    end 
    def logout
  session[:user_id] = nil
  redirect_to( :controller =>'lander' , :action => 'index')
end
end
