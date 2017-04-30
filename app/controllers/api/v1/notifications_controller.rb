module Api
  module V1
    class NotificationsController < ApplicationController
      before_action :find_notification

      def read_notification
        @notification.read_status = true

        if @notification.save
          render json: { status: true }, status: :ok
        else
          render json: { status: false }, status: 422
        end

      end

      private

      def find_notification
        @notification = Notification.find(params[:id])
      end

    end
  end
end


