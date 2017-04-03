# == Schema Information
#
# Table name: sections
#
#  id          :uuid             not null, primary key
#  heading     :string
#  description :text
#  image_url   :string
#  story_id    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SectionSerializer < ActiveModel::Serializer
  attributes :id, :heading, :description, :image_url
end
