# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string
#  overview   :string
#  image_url  :string
#  video_url  :string
#  goal       :string
#  model      :string
#  start_date :string
#  duration   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
  has_many :rewards, :faqs, :links, :events
  has_one :story


  accepts_nested_attributes_for :story, :rewards, :faqs, :links, :events, :allow_destroy => true

end
