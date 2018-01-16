class Event < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, lenght: { maximum: 50}
  validates :description, presence: true, length: { maximum:500 }
  validates :size, presence: true
  validates :image_url, presence: true
  validates :location, presence: true
  validates :price, presence: true
end
