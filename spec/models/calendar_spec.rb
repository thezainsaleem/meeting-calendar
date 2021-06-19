# frozen_string_literal: true

require "rails_helper"

RSpec.describe Calendar, type: :model do
  let(:valid_mentor_params) { { name: "dummy", time_zone: "-03:00" } }

  context "Validations" do
    before :each do
      @mentor = Mentor.create(valid_mentor_params)
    end
    context " mentor" do
      it "is must be present" do
        calendar = Calendar.new({
                                })
        expect(calendar).to_not be_valid
        calendar.mentor = @mentor
        expect(calendar).to be_valid
      end
    end
  end

  context "Creating new Calendar" do
    before :each do
      @mentor = Mentor.create(valid_mentor_params)
    end
    it "should increase length of total by 1 " do
      calendars_count = Calendar.count
      Calendar.create({ mentor: @mentor })
      expect(Calendar.count).to eq(calendars_count + 1)
    end
  end
end
