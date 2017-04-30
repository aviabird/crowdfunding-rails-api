# == Schema Information
#
# Table name: funding_transactions
#
#  id         :integer          not null, primary key
#  charge_id  :string
#  amount     :integer
#  currency   :string
#  project_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FundingTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :project

  after_create :create_notification


  def create_notification
    Notification.create(
      user_id: self.user_id,
      subject: 'Card Charge',
      description: 'Your card was charged for the project you funded'
    )
  end

end
