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
  has_many :rewards, inverse_of: :project
  has_many :faqs, inverse_of: :project
  has_many :links, inverse_of: :project
  has_many :events, inverse_of: :project
  has_one :story, inverse_of: :project

  accepts_nested_attributes_for :story, :rewards, :faqs, :links, :events, :allow_destroy => true

end
