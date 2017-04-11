# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  url        :string
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
