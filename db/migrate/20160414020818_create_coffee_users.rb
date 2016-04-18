class CreateCoffeeUsers < ActiveRecord::Migration
  def change
    create_table :coffee_users do |t|
      t.string :name
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
