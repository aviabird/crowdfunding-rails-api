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

class LiteUserSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :email, :total_backed_amount, :phone_no

  has_one :address

  def image_url
    return object.image_url if object.image_url
    return "http://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg"
  end

end
