# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  image_url       :string
#  password_digest :string
#  email_confirmed :boolean          default(FALSE)
#  confirm_token   :string
#  role_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :email

  def image_url
    return object.image_url if object.image_url
    return "http://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg"
  end

end

