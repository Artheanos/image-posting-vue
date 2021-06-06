# frozen_string_literal: true

module AuthHelper
  def http_login(user)
    token = Api::Auth::AuthenticateUser.new(user.email, user.password).call
    request.headers.merge!(Authentication: token)
  end
end
