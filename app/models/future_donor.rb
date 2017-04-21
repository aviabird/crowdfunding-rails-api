# == Schema Information
#
# Table name: future_donors
#
#  id          :integer          not null, primary key
#  customer_id :string
#  amount      :integer
#  project_id  :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FutureDonor < ApplicationRecord
  belongs_to :project
end
