# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  title          :string
#  aasm_state     :string
#  category_id    :integer
#  user_id        :integer
#  image_url      :string
#  video_url      :string
#  pledged_amount :integer
#  funded_amount  :integer          default(0)
#  total_backers  :integer          default(0)
#  funding_model  :string
#  start_date     :datetime
#  duration       :integer
#  approved       :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :video_url, :pledged_amount,
             :funded_amount, :percent_funded, :funding_model, :start_date, :duration, :category_id,
             :category_name, :user_name, :total_backers

  has_many :rewards
  has_many :faqs
  has_many :links
  has_one :story

  def category_name
    object.category.name
  end

  def user_name
    object.user.name
  end

  def percent_funded
    if(object.pledged_amount)
      (object.funded_amount.to_f/object.pledged_amount) * 100
    else
      0
    end
  end

end
