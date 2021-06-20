# frozen_string_literal: true

require "httparty"

class AgendaSyncer
  attr_reader :params, :created_count

  def initialize(params = {})
    @params        = params
    @created_count = 0
  end

  def call
    calendar_response.each do |slot|
      Slot.create!({
                     mentor_id: params.with_indifferent_access["mentor_id"],
                     calendar_id: params.with_indifferent_access["calendar_id"],
                     reason: "--",
                     start: slot["date_time"]
                   })
      @created_count += 1
    rescue ActiveModel::ValidationError => e
      puts e
    rescue StandardError => e
      puts e
    end
  rescue StandardError => e
    puts e.message
  end

  private

  # rubocop:disable Layout/LineLength
  def calendar_response
    response = HTTParty.get("https://private-37dacc-cfcalendar.apiary-mock.com/mentors/#{params.with_indifferent_access['mentor_id']}/agenda")
    body = JSON.parse(response.body)
    body["calendar"] || []
  end
  # rubocop:enable Layout/LineLength
end
