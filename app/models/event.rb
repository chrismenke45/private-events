class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 4..40 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :date, presence: true

  belongs_to :host, class_name: "User"
  has_and_belongs_to_many :attendees, class_name: "User"
end
