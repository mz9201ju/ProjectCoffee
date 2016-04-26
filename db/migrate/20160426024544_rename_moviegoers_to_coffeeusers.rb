class RenameMoviegoersToCoffeeusers < ActiveRecord::Migration
  def change
    rename_table :moviegoers, :coffeeusers
  end
end
