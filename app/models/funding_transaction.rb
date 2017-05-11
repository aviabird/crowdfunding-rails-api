# == Schema Information
#
# Table name: funding_transactions
#
#  id            :integer          not null, primary key
#  charge_id     :string
#  amount        :integer
#  currency      :string
#  project_id    :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  charge_status :string
#

class FundingTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :project

  after_create :create_notification


  def create_notification
    amount = self.amount / 100
    if (self.charge_status == "succeeded")
      Notification.create(
        user_id: self.user_id,
        subject: 'Card Charge',
        description: "Your card was charged with amount #{amount} for the project you funded"
      )
    end
  end

end
