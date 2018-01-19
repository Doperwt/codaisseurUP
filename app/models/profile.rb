class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true, length: { maximum: 50}
  validates :last_name, presence: true, length: { maximum: 50}
  validates :bio, presence: true, length: { maximum: 500}


end
