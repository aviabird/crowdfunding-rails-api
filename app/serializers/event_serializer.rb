class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :country, :date, :image_url, :description
end
