class Api::BaseController < ActionController::API
  # equivalent of authenticate_user! on devise, but this one will check the oauth token
  before_action :doorkeeper_authorize!

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  # helper method to access the current user from the token
  def current_user
    @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
    # @current_user ||= User.find(doorkeeper_token.resource_owner_id)
  end

  def not_found
    render json: { errors: "Not Found" }, status: :not_found
  end
end
