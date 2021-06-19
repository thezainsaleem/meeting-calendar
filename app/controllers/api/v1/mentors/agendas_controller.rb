module Api
  module V1
    module Mentors
      class AgendasController < ActionController::Base
        def index
          @agenda = Agenda.find_by(mentor_id: params[:id])
          render json: @agenda, status: :ok
        end
      end      
    end
  end
  
end