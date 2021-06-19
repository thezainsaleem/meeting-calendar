# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::Mentors::Calendars::SlotsController, type: :request do
  let(:valid_mentor_params) { { name: "dummy", time_zone: "-03:00" } }
  let(:valid_user_params) { { email: "student@email.com", password: "password", password_confirmation: "password" } }

  context "GET #index" do
    before(:each) do
      @mentor   = Mentor.create(valid_mentor_params)
      @user     = User.create(valid_user_params)
      @calendar = Calendar.create({ mentor: @mentor })
    end

    it "returns 200" do
      sign_in(@user)
      post api_v1_mentor_slots_path(@mentor), params: {
        "slot": {
          "start": "2020-02-02 12:13",
          "reason": "dummy"
        }
      }
      expect(response.status).to eq(200)
    end

    it "returns 200" do
      @slot = Slot.create({
                            mentor: @mentor,
                            user: @user,
                            calendar: @calendar,
                            start: "2020-03-03 00:00",
                            reason: "dummy"
                          })
      sign_in(@user)
      delete api_v1_mentor_slot_path(@mentor, @slot)
      expect(response.status).to eq(200)
    end
  end
end
