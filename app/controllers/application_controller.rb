class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  AUTHENTICATE_USER_EXCEPT_CONTROLLERS = ["sessions"]
  before_action :authenticate_user! 
  before_action :handle_unauthenticated

  respond_to :json

  private

  def authenticate_user!
    unless AUTHENTICATE_USER_EXCEPT_CONTROLLERS.include?(params[:controller])
      super
     end
  end

  def handle_unauthenticated
    unless current_user
      render json: { error: 'Authentication Error'}, status: 403
    end
  end
end
