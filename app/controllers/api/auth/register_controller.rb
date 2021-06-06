# frozen_string_literal: true

module Api
  module Auth
    class RegisterController < ApplicationController
      def create
        authentication = Api::Auth::AuthenticateUser.new(login_params[:email], login_params[:password])
        token = authentication.call
        if token
          render json: { token: token, user_id: authentication.user.id }
        else
          render json: {}, status: :unauthorized
        end
      end

      private

      def register_params
        params.permit(:email, :password)
      end
    end
  end
end
