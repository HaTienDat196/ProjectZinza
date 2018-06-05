class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :destroy

  before_destroy :check_if_has_line_item

  mount_uploader :image, ImageUploader

  def check_if_has_line_item
    if line_items.empty?
    else
      errors.add(:base, 'This product has a LineItem')
    end
  end
end
