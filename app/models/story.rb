# == Schema Information
#
# Table name: stories
#
#  id          :integer          not null, primary key
#  heading     :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer
#

class Story < ApplicationRecord
  belongs_to :project, inverse_of: :story
end
