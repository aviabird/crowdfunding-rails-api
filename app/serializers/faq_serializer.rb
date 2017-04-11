# == Schema Information
#
# Table name: faqs
#
#  id         :integer          not null, primary key
#  question   :text
#  answer     :text
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FaqSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer
end
