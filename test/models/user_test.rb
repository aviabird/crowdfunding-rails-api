# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  image_url       :string
#  password_digest :string
#  email_confirmed :boolean          default(FALSE)
#  confirm_token   :string
#  role_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  secondary_email :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
