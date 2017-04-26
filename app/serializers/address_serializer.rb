class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street_address, :city, :postcode, :country
end
