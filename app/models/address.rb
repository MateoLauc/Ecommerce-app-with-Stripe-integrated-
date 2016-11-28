class Address < ActiveRecord::Base
  belongs_to :country
  belongs_to :user
  has_many :orders_as_shippingAddress, :class_name => 'Order', :foreign_key => 'shippingAddress_id'
  has_many :orders_as_billingAddress, :class_name => 'Order', :foreign_key => 'billingAddress_id'
end
