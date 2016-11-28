class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :shippingAddress
      t.references :billingAddress
      t.string :name

      t.timestamps null: false
    end
  end
end
