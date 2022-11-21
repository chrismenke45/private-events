#class Enrollment < ApplicationRecord
class Enrollment < ActiveRecord::Base
  belongs_to :attended_event, class_name: "Event"
  belongs_to :attendee, class_name: "User"
end