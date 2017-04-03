# == Schema Information
#
# Table name: rewards
#
#  id          :uuid             not null, primary key
#  title       :string
#  description :text
#  image_url   :string
#  amount      :integer
#  project_id  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RewardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image_url, :amount
end
