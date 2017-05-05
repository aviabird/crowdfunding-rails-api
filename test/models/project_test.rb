# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  title          :string
#  aasm_state     :string
#  category_id    :integer
#  user_id        :integer
#  video_url      :string
#  pledged_amount :integer
#  funded_amount  :integer          default(0)
#  total_backers  :integer          default(0)
#  funding_model  :string
#  start_date     :datetime
#  duration       :integer
#  approved       :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  currency       :string
#  end_date       :datetime
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
