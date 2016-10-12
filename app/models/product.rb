class Product < ActiveRecord::Base
belongs_to :category
has_attached_file :image

end	