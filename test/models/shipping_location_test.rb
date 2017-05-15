# == Schema Information
#
# Table name: shipping_locations
#
#  id           :integer          not null, primary key
#  location     :string
#  shipping_fee :integer
#  reward_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ShippingLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
