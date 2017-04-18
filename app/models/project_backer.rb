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
  belongs_to :project
  belongs_to :user
end
