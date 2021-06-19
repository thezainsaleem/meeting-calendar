# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  let(:valid_user_params) { { email: "student@email.com", password: "password", password_confirmation: "password" } }

  context "Validations" do
    context " email" do
      it "is must be present and in correct format" do
        user = User.new({
                          password: "password",
                          password_confirmation: "password"
                        })
        expect(user).to_not be_valid
        user.email = "student"
        expect(user).to_not be_valid
        user.email = "student@eamil.com"
        expect(user).to be_valid
      end
    end

    context " password" do
      it "is must be present and match confirmation" do
        user = User.new({
                          email: "dummy@dummy.com"
                        })
        expect(user).to_not be_valid
        user.password = "password"
        user.password_confirmation = "password"
        expect(user).to be_valid
      end
    end
  end

  context "Creating new User" do
    it "should increase length of total by 1 " do
      users_count = User.count
      User.create(valid_user_params)
      expect(User.count).to eq(users_count + 1)
    end
  end

  context "Deleting User" do
    before :each do
      @user_to_destroy = User.create(valid_user_params)
    end

    it "should decrease length of total by 1" do
      users_count = User.count
      @user_to_destroy.destroy
      expect(User.count).to eq(users_count - 1)
    end
  end
end
