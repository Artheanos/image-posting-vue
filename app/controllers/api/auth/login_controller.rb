# frozen_string_literal: true

module Api
  module Auth
    class LoginController < ApplicationController
      def index
        render json: { test: 'test' }
      end

      def create
        credentials = ::AuthenticateUser.new(login_params[:email], login_params[:password]).call
        if credentials
          render json: { credentials: credentials }
        else
          render json: {}
        end
      end

      private

      def login_params
        params.permit(:email, :password)
      end
    end
  end
end
