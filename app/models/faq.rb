# == Schema Information
#
# Table name: faqs
#
#  id         :integer          not null, primary key
#  question   :text
#  answer     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Faq < ApplicationRecord
end
