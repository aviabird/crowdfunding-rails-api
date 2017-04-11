# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  country     :string
#  date        :date
#  image_url   :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
end
