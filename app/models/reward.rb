# == Schema Information
#
# Table name: rewards
#
#  id                         :integer          not null, primary key
#  title                      :string
#  description                :text
#  amount                     :integer
#  project_id                 :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  delivery_date              :datetime
#  quantity                   :integer
#  currency                   :string
#  backers_count              :integer          default(0)
#  contain_shipping_locations :boolean
#

class Reward < ApplicationRecord
  belongs_to :project, inverse_of: :rewards
  has_many :shipping_locations, inverse_of: :reward, dependent: :destroy

  accepts_nested_attributes_for :shipping_locations
end
