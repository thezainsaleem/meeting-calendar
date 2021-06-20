# frozen_string_literal: true

require "rails_helper"
require "webmock/rspec"

RSpec.describe AgendaSyncer, type: :service do
  context "" do
    before(:all) do
      expected_response_list = {
        "mentor": {
          "name": "dummy",
          "time_zone": "-03:00"
        },
        "calendar": [
          {
            "date_time": (Time.zone.now - (rand * 1000).to_i.days).to_s
          }
        ]
      }
      @mentor = Mentor.create(name: "dummy", time_zone: "-03:00")
      @calendar = Calendar.create(mentor_id: @mentor.id)
      stub_request(:get, "https://private-37dacc-cfcalendar.apiary-mock.com/mentors/#{@mentor.id}/agenda")
        .with(headers: {
                "Accept" => "*/*",
                "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
                "User-Agent" => "Ruby"
              })
        .to_return(status: 200, body: expected_response_list.to_json, headers: {})
    end

    context " when called for mentor 1" do
      it " creates one more slot" do
        agenda_syncer = AgendaSyncer.new({
          mentor_id: @mentor.id,
          calendar_id: @calendar.id
        }.to_h)
        agenda_syncer.call
        expect(agenda_syncer.created_count).to eq(1)
      end
    end
  end
end
