class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_one_attached :image

  accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes["name"].blank? }
  accepts_nested_attributes_for :steps, reject_if: proc { |attributes| attributes["step"].blank? || attributes["order"].blank? }

  def get_image
    if image.attached?
      image
    else
      "/assets/noimage.jpg" # 静的なデフォルト画像パスを返す
    end
  end

  def gooded_by?(user)
    goods.exists?(user_id: user.id)
  end

end
