class Mentor < ApplicationRecord
  has_one :calendar
  has_many :slots
end
