# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  country     :string
#  date        :date
#  image_url   :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :country, :date, :image_url, :description
end
