class ApplicationController < ActionController::API
  include JsonWebToken
  include Pundit::Authorization
  before_action :authenticate_request
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def not_found
    render json: { error: "No route matches #{params[:unmatched_route]}" }
  end

  def pundit_user
    @current_user
  end

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def user_not_authorized
    render json: { error: "Sorry, you are not authorized to do this." }, status: :forbidden
  end
end
