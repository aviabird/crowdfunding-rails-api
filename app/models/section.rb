# == Schema Information
#
# Table name: sections
#
#  id          :integer          not null, primary key
#  heading     :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Section < ApplicationRecord
  belongs_to: story, inverse_of: :sections
end
