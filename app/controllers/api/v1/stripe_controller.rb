module Api
  module V1
    class StripeController < ApplicationController
      before_action :authenticate_request, only: [:sofort_payments, :card_payments]
      before_action :find_project, only: [:sofort_payments, :card_payments]
      before_action :find_reward, only: [:sofort_payments, :card_payments]
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      def card_payments
        token = params[:stripeToken]
        amount = params[:amount]
        funding_type = @project.funding_model

        command = if(funding_type == "flexi")
          CreateCharge.call(token, amount, @current_user, @project, @reward) 
        else
          CreateFutureDonor.call(token, amount, @current_user, @project, @reward)
        end
        
        if command.success?
          message = funding_type == "flexi" ? "You have successfully backed this project"
            : "Thanks for backing this project, We will charge once this project is fully funded"
          render json: { message: message }
        else
          render json: { error: command.errors }
        end
      end

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

      #webhook for sofort payments, later on chnage this so that it will be uniform through all payments
      def webhook
        event_json = JSON.parse(request.body.read)
      end

      private

      def find_project
        @project = Project.find(params[:id])
      end

      def find_reward
        return @reward = nil if (!params[:reward_id])
        @reward = Reward.find(params[:reward_id])
      end

    end
  end
end

