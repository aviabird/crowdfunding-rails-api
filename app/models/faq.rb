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

class Faq < ApplicationRecord
  belongs_to :project, inverse_of: :faqs
end
