# == Schema Information
#
# Table name: sections
#
#  id          :integer          not null, primary key
#  heading     :string
#  description :text
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  story_id    :integer
#

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
