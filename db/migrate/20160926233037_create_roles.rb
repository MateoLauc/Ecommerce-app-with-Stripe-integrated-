class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :naziv

      t.timestamps null: false
    end
  end
end
