require 'rails_helper'

RSpec.describe Slot, type: :model do
  let (:valid_mentor_params) { { name: "dummy", time_zone: "-03:00" } }
  let (:valid_user_params) { { email: "student@email.com", password: "password", password_confirmation: "password" } }

  context 'Validations' do
    before (:each) do
      @mentor   = Mentor.create(valid_mentor_params)
      @user     = User.create(valid_user_params)
      @calendar = Calendar.create({mentor: @mentor})
    end
    context ' start date' do
      it ' must be present' do 
        slot = Slot.new({
          mentor: @mentor,
          user: @user,
          calendar: @calendar,
          reason: "dummy"
        })
        expect(slot).to_not be_valid
        slot.start = Time.zone.now
        expect(slot).to be_valid
      end
    end

    context ' reason' do
      it ' must be present' do 
        slot = Slot.new({
          mentor: @mentor,
          user: @user,
          calendar: @calendar,
          start: Time.zone.now
        })
        expect(slot).to_not be_valid
        slot.reason = "dummy"
        expect(slot).to be_valid
      end
    end

    context ' date conflict' do
      it ' should be blocked' do 
        slot_1 = Slot.create({
          mentor: @mentor,
          user: @user,
          calendar: @calendar,
          start: "2020-02-02 00:00",
          reason: "dummy"
        })
        slot = Slot.new({
          mentor: @mentor,
          user: @user,
          calendar: @calendar,
          start: "2020-02-02 00:00",
          reason: "dummy"
        })
        expect(slot).to_not be_valid
        slot.start = "2020-02-02 01:00"
        expect(slot).to be_valid
      end
    end
  end

  context 'Creating new Slot' do
    before (:each) do
      @mentor   = Mentor.create(valid_mentor_params)
      @user     = User.create(valid_user_params)
      @calendar = Calendar.create({mentor: @mentor})
    end

    it 'should increase length of total by 1 ' do
      slots_count = Slot.count()
      Slot.create({ mentor: @mentor, user: @user, calendar: @calendar, start: "2020-03-03 00:00", reason: "dummy"})
      expect(Slot.count).to eq(slots_count + 1)
    end
  end

end