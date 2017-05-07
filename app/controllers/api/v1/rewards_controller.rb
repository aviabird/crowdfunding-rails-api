module Api
  module V1
    class RewardsController < ApplicationController
      before_action :find_reward, only: [:show]

      def index
        @rewards = Reward.all
        render json: @rewards, status: :ok
      end

      def show
        render json: @reward, status: :ok
      end

      private

      def find_reward
        @reward = Reward.find(params[:id])
      end

    end
  end
end


