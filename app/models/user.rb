class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :booked_events, through: :bookings, source: :event
  has_many :events, dependent: :destroy
  has_one :profile, dependent: :destroy
  def full_name
    if self.profile
     "#{self.profile.first_name} #{self.profile.last_name}"
   else
     self.email
   end
  end
end
