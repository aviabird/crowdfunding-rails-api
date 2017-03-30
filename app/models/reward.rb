# == Schema Information
#
# Table name: rewards
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  image_url   :string
#  amount      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer
#

class Reward < ApplicationRecord
  belongs_to :project, inverse_of: :rewards
end
