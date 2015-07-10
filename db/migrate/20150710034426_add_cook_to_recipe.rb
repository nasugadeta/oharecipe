class AddCookToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :cook, :string
  end
end
