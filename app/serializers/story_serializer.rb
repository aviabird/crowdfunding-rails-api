# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class StorySerializer < ActiveModel::Serializer
  attributes :id, :heading, :description
end
