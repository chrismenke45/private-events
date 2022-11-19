class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { in: 1..35 }
  validates :family_name, presence: true, length: { in: 1..35 }

  has_many :hosted_events, class_name: "Event", foreign_key: "host_id"
  has_and_belongs_to_many :attended_events, class_name: "Event", foreign_key: "attendee_id"
end
