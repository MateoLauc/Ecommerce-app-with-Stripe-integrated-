require 'digest/md5'

 
class User < ActiveRecord::Base
  attr_accessor :role

  #Prije spremanja pokrece funkciju koja hashira password
  before_save :encrypt_password
  #Prije kreiranja novog zapisa u bazi dodjeliti default vrijednost za role
  before_create :default_role_value

def match_password(login_password="")
  password == Digest::MD5.hexdigest(login_password)
end
  private
    def default_role_value
    if(self.role.blank?)
      self.role_id =1
    end
  end 

  #Validacija 
  belongs_to :role
  validates :ime , :presence => true , :length => {:in =>3..20}
  validates :prezime , :presence => true , :length => {:in => 3..20}
  validates :email , :presence => true , :uniqueness => true , format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  
  def encrypt_password
    unless password.blank?
      	self.password = Digest::MD5.hexdigest(password)	
        end
         
end
 EMAIL_REGEX= /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/
def self.authenticate(ime_or_password="", login_password="")
  
  if  EMAIL_REGEX.match(ime_or_password)    
    user = User.find_by_email(ime_or_password)
  else
    user = User.find_by_ime(ime_or_password)
  end
  if user && user.match_password(login_password)
    return user
  else
    return false
  end
end   
  
  

end
	