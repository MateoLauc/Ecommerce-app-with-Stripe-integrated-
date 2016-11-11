class Variant < ActiveRecord::Base
	belongs_to :product
	belongs_to :size
	belongs_to :color
	has_many :line_items
	has_many :carts, :through => :line_items
end	
