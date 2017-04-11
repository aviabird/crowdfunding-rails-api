# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  title         :string
#  category_id   :integer
#  user_id       :integer
#  image_url     :string
#  video_url     :string
#  goal_amount   :integer
#  funding_model :string
#  start_date    :datetime
#  duration      :integer
#  approved      :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :video_url, :goal_amount, :funding_model, :start_date, :duration, :category_id

  has_many :rewards
  has_many :faqs
  has_many :links
  has_many :events
  has_one :story
end
