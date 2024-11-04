class Step < ApplicationRecord
  belongs_to :recipe
  validates :order, uniqueness: { scope: :recipe_id }
end
