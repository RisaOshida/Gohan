class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.bigint :recipe_id, null: false
      t.bigint :user_id, null: false
      t.timestamps
    end

    add_foreign_key :comments, :recipes
    add_foreign_key :comments, :users
  end
end
