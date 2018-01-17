class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  validates :name, presence: true, length: { maximum: 50}
  validates :description, presence: true, length: { maximum:500 }
  validates :size, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  def find
    @event = Event.where(q)
  end
end
