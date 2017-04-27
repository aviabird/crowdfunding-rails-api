# == Schema Information
#
# Table name: social_links
#
#  id         :integer          not null, primary key
#  url        :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SocialLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
