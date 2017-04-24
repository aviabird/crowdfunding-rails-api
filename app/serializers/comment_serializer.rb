class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :project_id, :user_name, :user_avatar, :created_at

  def user_name
    object.user.name
  end

  def user_avatar
    object.user.image_url
  end

end
