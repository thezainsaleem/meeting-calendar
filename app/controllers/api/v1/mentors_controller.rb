# frozen_string_literal: true

module Api
  module V1
    class MentorsController < ActionController::Base
      before_action :authenticate_user!
      def show
        @mentor = Mentor.find_by(id: params[:id])
        render json: @mentor, status: :ok
      end

      def index
        @mentors = Mentor.all
        render json: @mentors, status: :ok
      end
    end
  end
end
