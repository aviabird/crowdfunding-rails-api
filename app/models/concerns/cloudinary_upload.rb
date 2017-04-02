require 'active_support/concern'

module CloudinaryConcern
  extend ActiveSupport::Concern

  included do
    def upload_image(image_data)
      Cloudinary::Uploader.upload(image_data, options = {})
    end
  end
end
