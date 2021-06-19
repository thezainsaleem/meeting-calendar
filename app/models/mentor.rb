# frozen_string_literal: true

class Mentor < ApplicationRecord
  has_one :calendar
  has_many :slots

  validates :name, presence: true, length: { in: 1..254 }
  validates :time_zone, presence: true, format: { with: /[+-][0-9]{2}:[0-9]{2}\b/ }
end
