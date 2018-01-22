class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :visitors, through: :bookings, source: :user

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
    order(price: :asc )
  end
  def self.outdoor_booked


  end
  def self.outdoor_count
     Event.joins(:categories).where(:categories => { :name=>"outdoor" }).sum(:size)
  end
  def self.need_sort(search)
    case search
    when "Name Ascending"
      order(name: :asc)
    when "Name Descending"
      order(name: :desc)
    when "Size Ascending"
      order(size: :asc )
    when "Size Descending"
      order(size: :desc )
    else
      order(name: :asc)
    end
  end
  def bargain?
    price < BARGAIN_PRICE
  end
  private
  def check_user?
    current_user.id == true
  end
end
