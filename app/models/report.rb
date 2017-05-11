# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  reason     :text
#  project_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ApplicationRecord
end
