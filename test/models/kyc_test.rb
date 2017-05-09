# == Schema Information
#
# Table name: kycs
#
#  id                 :integer          not null, primary key
#  document_image_url :string
#  document_id        :string
#  document_type      :string
#  name               :string
#  nationality        :string
#  birth_date         :datetime
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class KycTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
