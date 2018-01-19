class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :group_size, presence: true, numericality: {less_than_or_equal_to: 3,  only_integer: true}

  def total_price
    self.price * self.group_size
  end
end
