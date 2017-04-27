# == Schema Information
#
# Table name: addresses
#
#  id             :integer          not null, primary key
#  street_address :string
#  city           :string
#  postcode       :integer
#  country        :string
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street_address, :city, :postcode, :country
end
