# frozen_string_literal: true

class Slot < ApplicationRecord
  belongs_to :calendar
  belongs_to :mentor
  belongs_to :user, optional: true

  validates :start, presence: true, length: { in: 1..254 }
  validates :reason, presence: true

  validate :clashes_in_calendar
  before_create :set_dates

  def set_dates
    self.start = start.beginning_of_hour
    self.end   = start.end_of_hour
  rescue StandardError
    errors.add(:base, "Dates Parsing Error")
    false
  end

  def clashes_in_calendar
    if calendar.slots.where(start: start.beginning_of_hour).exists?
      errors.add(:base, "This Slot is Already Allocated")
    end
  rescue StandardError
    errors.add(:base, "Invalid Data")
  end
end
