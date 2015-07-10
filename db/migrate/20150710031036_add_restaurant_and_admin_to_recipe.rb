class AddRestaurantAndAdminToRecipe < ActiveRecord::Migration
  def change
    add_reference :recipes, :restaurant, index: true, foreign_key: true
    add_reference :recipes, :admin, index: true, foreign_key: true
  end
end
