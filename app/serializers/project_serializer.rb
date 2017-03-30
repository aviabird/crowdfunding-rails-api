class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :overview, :image_url, :video_url, :goal, :model, :start_date, :duration
end
