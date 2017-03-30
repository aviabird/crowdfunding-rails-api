# == Schema Information
#
# Table name: rewards
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  image_url   :string
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
