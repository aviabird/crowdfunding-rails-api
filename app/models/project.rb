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

class Project < ApplicationRecord
  
  has_many :rewards, inverse_of: :project, dependent: :destroy
  has_many :faqs, inverse_of: :project, dependent: :destroy
  has_many :links, inverse_of: :project, dependent: :destroy
  has_one :story, inverse_of: :project, dependent: :destroy
  
  belongs_to :category
  belongs_to :user, inverse_of: :projects
  accepts_nested_attributes_for :story, :rewards, :faqs, :links, :allow_destroy => true

  def self.draft(user)
    category = Category.find_by_name("Art")
    project = user.projects.build(category_id: category.id)
    project.rewards.build
    project.faqs.build
    project.links.build
    project.build_story
    project.story.sections.build
    project.save
    project
  end

end
