# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  def current_user
    @current_user ||= Api::Auth::AuthorizeUser.new(request.headers).call
  end

  def not_authorized
    render json: {}, status: :unauthorized
  end
end
