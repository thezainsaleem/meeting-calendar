# frozen_string_literal: true

module Api
  module V1
    module Mentors
      module Calendars
        class DaysController < ApplicationController
          def show
            slots = Slot.where(
              start: DateTime.parse(params[:id]).beginning_of_day..DateTime.parse(params[:id]).end_of_day
            )
            slots_by_hour = {}
            24.times do |hour|
              slots_by_hour[hour] = nil
            end
            slots.each do |slot|
              slots_by_hour[slot.start.hour] = slot
            end
            render json: slots_by_hour, status: :ok
          end

          def destroy
            @slot = Slot.find_by(id: params[:id]).destroy
            render json: @slot, status: :ok
          end

          private

          def load_mentor
            @mentor = Mentor.find_by!(id: params[:mentor_id])
          end

          def load_calendar
            @calendar = Calendar.find_by!(mentor_id: params[:mentor_id])
          end

          def slot_params
            params.require(:slot).permit(:start, :reason)
          end
        end
      end
    end
  end
end
