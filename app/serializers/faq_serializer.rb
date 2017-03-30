# == Schema Information
#
# Table name: faqs
#
#  id         :integer          not null, primary key
#  question   :text
#  answer     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class FaqSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer
end
