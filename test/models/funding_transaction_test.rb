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

require 'test_helper'

class FundingTransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
