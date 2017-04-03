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

class Faq < ApplicationRecord
  belongs_to :project, inverse_of: :faqs
end
