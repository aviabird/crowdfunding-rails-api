class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :overview, :image_url, :video_url, :goal, :model, :start_date, :duration

  has_many :rewards
  has_many :faqs
  has_many :links
  has_many :events
  has_one :story
end
