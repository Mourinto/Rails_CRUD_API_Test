class Transaction < ApplicationRecord
  scope :by_type, ->(type) { where type: type }
  scope :price_range, ->(min, max) { where('price > ? AND price < ?', min, max) }
  scope :sq_ft_range, ->(min, max) { where('sq__ft > ? AND sq__ft < ?', min, max) }
  validates_presence_of :street

end
