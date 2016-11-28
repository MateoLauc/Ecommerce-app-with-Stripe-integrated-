class Order < ActiveRecord::Base
  belongs_to :shippingAddress, :class_name =>'Address'
  belongs_to :billingAddress, :class_name =>'Address'
end
