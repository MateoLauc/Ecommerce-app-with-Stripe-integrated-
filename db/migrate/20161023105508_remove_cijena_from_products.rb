class RemoveCijenaFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :cijena, :double
  end
end
