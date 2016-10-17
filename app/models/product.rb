class Product < ActiveRecord::Base
belongs_to :category
#Ova metoda asocira atribut sa prikacenim fajlom 
has_attached_file :image ,styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  #Validacija prikacenog fajla
 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
attr_accessor :category
before_create :default_category_value
   def default_category_value
      self.category_id =2
  end 
validates :naziv, :presence => true 
validates :opis,	:presence => true 
validates :cijena, :presence => true 
validates :kolicina, :presence => true 
end	