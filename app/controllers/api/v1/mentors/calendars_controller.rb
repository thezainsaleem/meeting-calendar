# frozen_string_literal: true

module Api
  module V1
    module Mentors
      class CalendarsController < ApplicationController
        def show
          @calendar = Calendar.find_by(mentor_id: params[:mentor_id])
          render json: @calendar, status: :ok
        end
      end
    end
  end
end
