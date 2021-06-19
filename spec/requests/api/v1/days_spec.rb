# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::Mentors::Calendars::DaysController, type: :request do
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
      get api_v1_mentor_day_path(@mentor, "2020-02-02")
      expect(response.status).to eq(200)
    end
  end
end
