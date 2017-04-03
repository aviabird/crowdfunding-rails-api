# == Schema Information
#
# Table name: stories
#
#  id         :uuid             not null, primary key
#  project_id :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Story < ApplicationRecord
  has_many :sections, inverse_of: :story, dependent: :destroy
  belongs_to :project, inverse_of: :story

  accepts_nested_attributes_for :sections, :allow_destroy => true

end
