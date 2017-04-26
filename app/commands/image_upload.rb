class ImageUpload
  prepend SimpleCommand
  
  def initialize(image_data)
    @image_data = image_data
  end

  def call
    upload_image
  end

  def upload_image
    tries = 3
    begin
      response = Cloudinary::Uploader.upload(@image_data, options = {})
    rescue
      tries -= 1
      if tries > 0
        retry
      else
        errors.add(:upload_image, 'Failed to Upload to Cloudinary')
      end
    ensure
      return response ? response["secure_url"] : nil
    end
  end

end