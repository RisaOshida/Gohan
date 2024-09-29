class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.string :weight, null: false
      t.bigint :recipe_id, null: false
      t.timestamps
    end

    add_foreign_key :ingredients, :recipes
  end
end
