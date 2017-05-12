# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  title          :string
#  aasm_state     :string
#  category_id    :integer
#  user_id        :integer
#  video_url      :string
#  pledged_amount :integer
#  funded_amount  :integer          default(0)
#  total_backers  :integer          default(0)
#  funding_model  :string
#  start_date     :datetime
#  duration       :integer
#  approved       :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  currency       :string
#  end_date       :datetime
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
      transitions :from => :pending_approval, :to => :funding, :after => :send_project_approval_mail
    end

    event :project_funded do
      transitions :from => :funding, :to => :funded
    end

    event :project_not_funded do
      transitions :from => :funding, :to => :not_funded
    end

  end

  before_save :set_project_end_date

  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :rewards, inverse_of: :project, dependent: :destroy
  has_many :faqs, inverse_of: :project, dependent: :destroy
  has_many :links, inverse_of: :project, dependent: :destroy
  has_many :project_backers, dependent: :destroy
  has_many :backers, through: :project_backers
  has_many :funding_transactions
  has_many :future_donors
  has_one :story, inverse_of: :project, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_update :update_user_role, if: -> (model) {model.approved_changed? && model.approved}

  belongs_to :category
  belongs_to :user, inverse_of: :projects
  accepts_nested_attributes_for :story
  accepts_nested_attributes_for :pictures, :rewards, :faqs, :links, :allow_destroy => true

  def self.draft(user)
    category = Category.find_by_name("Art")
    project = Project.new(category_id: category.id, user_id: user.id)
    project.save
    project
  end

  def update_user_role
    Notification.create(
      user_id: self.user_id,
      subject: 'Project Approval',
      description: 'Your project was approved by the admin, now donors can fund into your project'
    )
    self.approve_project
    self.user.update_user_role_to_creator
  end

  def send_project_approval_mail
    UserMailer.project_approved(self).deliver
  end

  def set_project_end_date
    start_date = self.start_date || Time.now
    duration = self.duration || 0
    self.end_date = start_date + duration.days
  end


end
