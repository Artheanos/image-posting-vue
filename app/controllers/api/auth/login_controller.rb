# frozen_string_literal: true

module Api
  module Auth
    class LoginController < ApplicationController
      def index
        render json: { test: 'test' }
      end

      def create
        token = Api::Auth::AuthenticateUser.new(login_params[:email], login_params[:password]).call
        if token
          render json: { token: token }
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
