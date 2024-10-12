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
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'noimage.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def gooded_by?(user)
    goods.exists?(user_id: user.id)
  end

end
