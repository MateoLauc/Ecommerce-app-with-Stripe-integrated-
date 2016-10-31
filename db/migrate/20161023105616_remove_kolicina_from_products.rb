class RemoveKolicinaFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :kolicina, :integer
  end
end
