# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  key        :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Setting < ApplicationRecord
  attr_readonly :key

  def self.find_application_fee
    Setting.find_by_key("application_fee_percent").value
  end

end
