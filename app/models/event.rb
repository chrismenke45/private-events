#class Event < ApplicationRecord
class Event < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { in: 4..40 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :date, presence: true, comparison: { greater_than: DateTime.now, message: "must be set in the future" }

  belongs_to :host, class_name: "User"
  has_many :enrollments, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :enrollments

  scope :past, -> { where("date < ?", DateTime.now).order(date: :desc) }
  scope :upcoming, -> { where("date >= ?", DateTime.now).order(date: :asc) }
end
