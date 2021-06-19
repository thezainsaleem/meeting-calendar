# frozen_string_literal: true

module Api
  module V1
    module Mentors
      module Calendars
        class SlotsController < ApplicationController
          # skip_before_action :verify_authenticity_token

          before_action :slot_params, only: [:create]
          before_action :load_mentor

          def create
            @slot = @mentor.calendar.slots.create(slot_params.merge(mentor: @mentor, user: current_user))
            if @slot.persisted?
              render json: { mesage: created_success_message(@slot, @mentor) }, status: :ok
            else
              render json: { errors: @slot.errors.full_messages }, status: :ok
            end
          end

          def destroy
            @slot = Slot.find_by(id: params[:id]).destroy
            if @slot.destroyed?
              render json: @slot, status: :ok
            else
              render json: { errors: @slot.errors.full_messages }, status: :ok
            end
          end

          private

          def created_success_message(slot, mentor)
            "Meeting scheduled on #{slot.start.to_formatted_s} with #{mentor.name} successfully"
          end

          def load_mentor
            @mentor = Mentor.find_by!(id: params[:mentor_id])
          end

          def slot_params
            params.require(:slot).permit(:start, :reason)
          end
        end
      end
    end
  end
end
