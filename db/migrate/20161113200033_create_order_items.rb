class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :nazivproivoda
      t.integer :qty
      t.decimal :cijena
      t.integer :size
      t.string :color
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
