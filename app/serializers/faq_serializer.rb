# == Schema Information
#
# Table name: faqs
#
#  id         :uuid             not null, primary key
#  question   :text
#  answer     :text
#  project_id :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FaqSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer
end
