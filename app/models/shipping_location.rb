# == Schema Information
#
# Table name: shipping_locations
#
#  id           :integer          not null, primary key
#  location     :string
#  shipping_fee :integer
#  reward_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ShippingLocation < ApplicationRecord
  belongs_to :reward, inverse_of: :shipping_locations
end
