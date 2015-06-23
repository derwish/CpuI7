class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: {minimum: 10, message: 'must be longer than 9 chars'}

  validates :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
