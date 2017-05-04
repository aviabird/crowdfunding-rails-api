# == Schema Information
#
# Table name: rewards
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  amount        :integer
#  project_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  delivery_date :datetime
#  quantity      :integer
#

require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
