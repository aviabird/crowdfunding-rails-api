# == Schema Information
#
# Table name: rewards
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  image_url   :string
#  amount      :integer
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Reward < ApplicationRecord
  belongs_to :project, inverse_of: :rewards
end
