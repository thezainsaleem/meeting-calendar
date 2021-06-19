class Slot < ApplicationRecord
  belongs_to :calendar
  belongs_to :mentor
  belongs_to :user

  validates :start, presence: true, length: { in: 1..254 }
  validates :reason, presence: true

  validate :clashes_in_calendar
  before_create :set_dates

  def set_dates
    begin
      self.start = start.beginning_of_hour
      self.end   = start.end_of_hour
    rescue => exception
      self.errors.add(:base, "Dates Parsing Error")
      return false
    end
  end

  def clashes_in_calendar
    begin
      if self.calendar.slots.where(start: self.start.beginning_of_hour).exists?
        self.errors.add(:base, "This Slot is Already Allocated")
      end
    rescue
      self.errors.add(:base, "Invalid Data")
    end
  end
end
