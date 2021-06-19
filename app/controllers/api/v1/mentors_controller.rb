module Api
  module V1
    class MentorsController < ActionController::Base
      def show
        @mentor = Mentor.find_by(id: params[:id])
        render json: @mentor, status: :ok
      end

    end
  end
  
end