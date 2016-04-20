class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :milk
      t.string :sugar
      t.string :coffee_blend
      t.string :strength
      
      t.timestamps null: false
    end
  end
end
