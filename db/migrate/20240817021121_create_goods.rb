class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.bigint :recipe_id, null: false
      t.bigint :user_id, null: false
      t.timestamps
    end

    add_foreign_key :goods, :recipes
    add_foreign_key :goods, :users
    add_index :goods, [:recipe_id, :user_id], unique: true
  end
end
