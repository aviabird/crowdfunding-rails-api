# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StorySerializer < ActiveModel::Serializer
  attributes :id

  has_many :sections
end
