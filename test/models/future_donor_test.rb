# == Schema Information
#
# Table name: future_donors
#
#  id          :integer          not null, primary key
#  customer_id :string
#  amount      :integer
#  project_id  :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class FutureDonorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
