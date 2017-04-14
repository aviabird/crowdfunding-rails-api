class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :email

  def image_url
    return image_url if object.image_url
    return "http://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg"
  end

end

