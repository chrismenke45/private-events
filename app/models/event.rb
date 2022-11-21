#class Event < ApplicationRecord
class Event < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { in: 4..40 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :date, presence: true

  belongs_to :host, class_name: "User"
  has_many :enrollments, foreign_key: :attended_event_id
  has_many :attendees, through: :enrollments
end
