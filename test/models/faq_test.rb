# == Schema Information
#
# Table name: faqs
#
#  id         :uuid             not null, primary key
#  question   :text
#  answer     :text
#  project_id :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FaqTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
