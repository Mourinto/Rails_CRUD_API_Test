class Transaction < ApplicationRecord

  # Search endpoint to search the DB
  scope :by_category, ->(category) { where category: category }
  scope :price_range, ->(min, max) { where('price >= ? AND price <= ?', min, max) }
  scope :sq_ft_range, ->(min, max) { where('sq__ft > ? AND sq__ft < ?', min, max) }

  # validations
  validates_presence_of :category
  validates :price, presence: true, numericality: { only_integer: true }
  validates :sq__ft, presence: true, numericality: { only_integer: false }

end
