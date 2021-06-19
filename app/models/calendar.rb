# frozen_string_literal: true

class Calendar < ApplicationRecord
  belongs_to :mentor
  has_many :slots
end
