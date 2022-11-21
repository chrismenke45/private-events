#class User < ApplicationRecord
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { in: 1..35 }
  validates :family_name, presence: true, length: { in: 1..35 }

  has_many :hosted_events, class_name: "Event", foreign_key: "host_id", inverse_of: "host"
  has_many :enrollments, foreign_key: :attendee_id
  has_many :attended_events, through: :enrollments
end
