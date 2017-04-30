# == Schema Information
#
# Table name: notifications
#
#  id          :integer          not null, primary key
#  subject     :string
#  description :text
#  read_status :boolean          default(FALSE)
#  read_at     :datetime
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Notification < ApplicationRecord
  belongs_to :user
end
