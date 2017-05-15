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

class ShippingLocationSerializer < ActiveModel::Serializer
  attributes :id, :location, :shipping_fee
end
