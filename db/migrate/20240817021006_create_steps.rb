class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.string :step, null: false
      t.integer :order, null: false
      t.bigint :recipe_id, null: false
      t.timestamps
    end

    add_foreign_key :steps, :recipes
    add_index :steps, [:order, :recipe_id], unique: true
  end
end
