# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mentor, type: :model do
  let(:valid_mentor_params) { { name: "dummy", time_zone: "-03:00" } }

  context "Validations" do
    context " name" do
      it "is must be present" do
        mentor = Mentor.new({
                              time_zone: "-03:00"
                            })
        expect(mentor).to_not be_valid
        mentor.name = "Some name"
        expect(mentor).to be_valid
      end
    end

    context " timezone" do
      it "is must be present" do
        mentor = Mentor.new({
                              name: "dummy"
                            })
        expect(mentor).to_not be_valid
        mentor.time_zone = "-03:00"
        expect(mentor).to be_valid
      end

      it "is must have valid format" do
        mentor = Mentor.new({
                              name: "dummy",
                              time_zone: "GMT 1"
                            })
        expect(mentor).to_not be_valid
        mentor.time_zone = "-03:00"
        expect(mentor).to be_valid
      end
    end
  end

  context "Creating new Mentor" do
    it "should increase length of total by 1 " do
      mentors_count = Mentor.count
      Mentor.create(valid_mentor_params)
      expect(Mentor.count).to eq(mentors_count + 1)
    end
  end

  context "Deleting User" do
    before :each do
      @mentor_to_destroy = Mentor.create(valid_mentor_params)
    end

    it "should decrease length of total by 1" do
      mentors_count = Mentor.count
      @mentor_to_destroy.destroy
      expect(Mentor.count).to eq(mentors_count - 1)
    end
  end
end
