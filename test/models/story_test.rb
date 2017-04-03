# == Schema Information
#
# Table name: stories
#
#  id         :uuid             not null, primary key
#  project_id :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
