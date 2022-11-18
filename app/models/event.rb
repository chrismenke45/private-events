class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 4..40 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :date, presence: true
end
