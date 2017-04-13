# == Schema Information
#
# Table name: social_auths
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string
#  uid        :string
#  token      :string
#  secret     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SocialAuthTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
