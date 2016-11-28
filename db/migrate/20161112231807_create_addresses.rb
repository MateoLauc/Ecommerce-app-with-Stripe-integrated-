class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :imeprezime
      t.string :naziv
      t.string :city
      t.string :regija
      t.integer :zip
      t.references :country, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
