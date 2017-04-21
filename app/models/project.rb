# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  title          :string
#  aasm_state     :string
#  category_id    :integer
#  user_id        :integer
#  image_url      :string
#  video_url      :string
#  pledged_amount :integer
#  funded_amount  :integer
#  funding_model  :string
#  start_date     :datetime
#  duration       :integer
#  approved       :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Project < ApplicationRecord
  
  include AASM

  aasm do
    state :draft, :initial => true
    state :pending_approval, :not_approved, :funding, :funded, :not_funded

    event :launch_project do
      transitions :from => :draft, :to => :pending_approval
    end

    event :project_not_approved do
      transitions :from => :pending_approval, :to => :not_approved
    end

    event :approve_project do
      transitions :from => :pending_approval, :to => :funding
    end

    event :project_funded do
      transitions :from => :funding, :to => :funded
    end

    event :project_not_funded do
      transitions :from => :funding, :to => :not_funded
    end

  end

  has_many :rewards, inverse_of: :project, dependent: :destroy
  has_many :faqs, inverse_of: :project, dependent: :destroy
  has_many :links, inverse_of: :project, dependent: :destroy
  has_many :project_backers, dependent: :destroy
  has_many :backers, through: :project_backers
  has_many :funding_transactions
  has_many :future_donors
  has_one :story, inverse_of: :project, dependent: :destroy

  before_update :update_user_role, if: -> (model) {model.approved_changed? && model.approved}

  belongs_to :category
  belongs_to :user, inverse_of: :projects
  accepts_nested_attributes_for :story, :rewards, :faqs, :links, :allow_destroy => true

  def self.draft(user)
    category = Category.find_by_name("Art")
    project = Project.new(category_id: category.id, user_id: user.id)
    project.rewards.build
    project.faqs.build
    project.links.build
    project.build_story
    project.story.sections.build
    project.save
    project
  end

  def update_user_role
    self.approve_project
    self.user.update_user_role_to_creator
  end

end
