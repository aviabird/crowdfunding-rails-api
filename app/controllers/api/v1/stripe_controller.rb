module Api
  module V1
    class StripeController < ApplicationController
      before_action :authenticate_request, only: [:sofort_payments]
      before_action :find_project, only: [:sofort_payments]
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      def sofort_payments
        token = params[:stripeToken]
        amount = params[:amount]
        command = SofortPayment.call(token, amount, @current_user, @project) 
        if command.success?
          message = command.result
          render json: { message: message }
        else
          render json: { error: command.errors }
        end
      end

      def webhook
        binding.pry
        event_json = JSON.parse(request.body.read)
      end

      def find_project
        @project = Project.find(params[:id])
      end

    end
  end
end

