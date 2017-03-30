# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class LinkSerializer < ActiveModel::Serializer
  attributes :id, :url
end
