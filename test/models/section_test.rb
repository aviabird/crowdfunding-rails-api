# == Schema Information
#
# Table name: sections
#
#  id          :uuid             not null, primary key
#  heading     :string
#  description :text
#  image_url   :string
#  story_id    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
