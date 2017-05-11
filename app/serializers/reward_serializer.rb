# == Schema Information
#
# Table name: rewards
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  amount        :integer
#  project_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  delivery_date :datetime
#  quantity      :integer
#  currency      :string
#  backers_count :integer          default(0)
#

class RewardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :amount, :delivery_date, :quantity, :currency, :backers_count
end
