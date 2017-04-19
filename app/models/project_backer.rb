# == Schema Information
#
# Table name: project_backers
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectBacker < ApplicationRecord
  belongs_to :backed_project, class_name: 'Project', foreign_key: 'project_id'
  belongs_to :backer, class_name: 'User', foreign_key: 'user_id'
end
