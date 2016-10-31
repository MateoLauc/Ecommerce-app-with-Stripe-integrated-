class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.references :color, index: true, foreign_key: true
      t.references :size, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :qty
      t.decimal :price
    end
  end
end
