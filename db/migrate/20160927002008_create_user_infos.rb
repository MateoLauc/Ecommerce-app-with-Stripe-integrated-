class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :broj
      t.date :datumRodjenja
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
