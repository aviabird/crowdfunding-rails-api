# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  project_id   :integer
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  parent_id    :integer
#  author_name  :string
#  author_image :string
#

class Comment < ApplicationRecord
  acts_as_tree order: 'created_at DESC', dependent: :delete_all

  belongs_to :user
  belongs_to :project
end
