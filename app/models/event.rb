class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos
  validates :name, presence: true, length: { maximum: 50}
  validates :description, presence: true, length: { maximum:500 }
  validates :size, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  BARGAIN_PRICE = 30

  def validate_user?(user)
    user_id == user.id
  end

  def self.order_by_price
    Event.order(price: :asc )
  end

  def bargain?
    price < BARGAIN_PRICE
  end
  private
  def check_user?
    current_user.id == true
  end
end
