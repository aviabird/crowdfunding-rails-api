# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :project_id, :user_name, :user_avatar, :created_at

  def user_name
    object.user.name
  end

  def user_avatar
    object.user.image_url
  end

end
