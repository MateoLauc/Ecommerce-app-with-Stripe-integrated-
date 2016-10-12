class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :naziv
      t.text :opis
      t.float :cijena
      t.integer :kolicina
    end
  end
end
