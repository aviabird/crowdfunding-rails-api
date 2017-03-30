# == Schema Information
#
# Table name: stories
#
#  id          :integer          not null, primary key
#  heading     :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer
#

class StorySerializer < ActiveModel::Serializer
  attributes :id, :heading, :description
end
