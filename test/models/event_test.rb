# == Schema Information
#
# Table name: events
#
#  id          :uuid             not null, primary key
#  title       :string
#  country     :string
#  date        :date
#  image_url   :string
#  description :text
#  project_id  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
