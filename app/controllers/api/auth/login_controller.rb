# frozen_string_literal: true

module Api
  module Auth
    class LoginController < ApplicationController
      def index
        render json: { test: 'test' }
      end

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

      def login_params
        params.permit(:email, :password)
      end
    end
  end
end
