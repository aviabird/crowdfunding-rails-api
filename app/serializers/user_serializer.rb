# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  name                :string
#  email               :string
#  image_url           :string
#  password_digest     :string
#  email_confirmed     :boolean          default(FALSE)
#  confirm_token       :string
#  role_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  secondary_email     :string
#  facebook_url        :string
#  twitter_url         :string
#  instagram_url       :string
#  google_plus_url     :string
#  phone_no            :string
#  total_backed_amount :integer          default(0)
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :email, :secondary_email, :phone_no, :role_name,
             :facebook_url, :twitter_url, :instagram_url, :google_plus_url, :backed_projects,
             :project_backers

  has_one :address
  has_many :projects, serializer: LiteProjectSerializer
  has_many :backed_projects, serializer: LiteProjectSerializer
  has_many :notifications
  has_one :project_in_funding_state, serializer: LiteProjectSerializer

  def image_url
    return object.image_url ? object.image_url : "http://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg"
  end

  def project_backers
    object.backers
  end

end

