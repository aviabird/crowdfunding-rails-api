# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class Story < ApplicationRecord
  has_many :sections, inverse_of: :story, dependent: :destroy
  belongs_to :project, inverse_of: :story

  accepts_nested_attributes_for :sections, :allow_destroy => true

end
