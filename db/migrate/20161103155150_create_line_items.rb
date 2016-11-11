class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :variant_id
      t.integer :cart_id
      t.integer :qty

      t.timestamps null: false
    end
  end
end
