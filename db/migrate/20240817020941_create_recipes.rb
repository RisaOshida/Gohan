class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :introduction
      t.string :energy
      t.string :protein
      t.string :fat
      t.string :sodium
      t.bigint :category_id, null: false
      t.bigint :user_id, null: false
      t.timestamps
    end

    add_foreign_key :recipes, :categories
    add_foreign_key :recipes, :users
  end
end
