# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  AUTHENTICATE_USER_EXCEPT_CONTROLLERS = ["sessions"].freeze
  before_action :authenticate_user!
  before_action :handle_unauthenticated

  respond_to :json

  private

  def authenticate_user!
    return if AUTHENTICATE_USER_EXCEPT_CONTROLLERS.exclude?(params[:controller])
    super
  end

  def handle_unauthenticated
    return if current_user
    render json: { error: "Authentication Error" }, status: 403
  end
end
