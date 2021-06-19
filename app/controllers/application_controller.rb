class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  before_action :authenticate_student!
  before_action :handle_unauthenticated
 
 respond_to :json
 
 private
 
 def handle_unauthenticated
   unless current_student
     render json: { error: 'Authentication Error'}, status: 403
   end
 end
end
