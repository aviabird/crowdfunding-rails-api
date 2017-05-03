module ProjectService
  class CreateProject < Service
    
    TYPES = {
      'project' => Project,
      'story' => Story,
      'reward' => Reward,
      'link' => Link,
      'faq' => Faq,
      'event' => Event 
    }

    def initialize(params)
      @type = params[:type]
      @params = params
      @result = {}
    end

    def call
      find_or_init_project
      perform_image_upload_callbacks
      @result[:status] = @project.save
      @result[:model] = @project
      return @result
    end

    private
    
    def find_or_init_project
      @project = Project.find_or_initialize_by(id: @params[:id])
      @project.attributes = permitted_params
    end

    def permitted_params
      @params.permit(*project_attributes)
    end

    def project_attributes
      [
        :id, :title, :video_url, :pledged_amount, :funding_model, :duration, :category_id,
        pictures_attributes: [:id, :url, :_destroy],
        rewards_attributes: [:id, :title, :description, :image_url, :amount, :_destroy],
        story_attributes: [:id, sections_attributes: [:id, :heading, :description] ],
        faqs_attributes: [:id, :question, :answer],
        links_attributes: [:id, :url],
        events_attributes: [:id, :title, :country, :date, :image_url, :description]
      ]  
    end

    def perform_image_upload_callbacks
      case @type
      when 'project'
        upload_project_images
      when 'story'
        upload_story_images
      when 'reward'
        upload_reward_images
      end
    end

    def upload_project_images
      images_data = @params[:images_data]
      return if images_data.length == 0
      images_data.each do |image_data|
        command = ImageUpload.call(image_data)
        if command.success?
          url = command.result
          @project.pictures << Picture.new(url: url)
        end
      end
    end

    def upload_story_images
      @params["story_attributes"]["sections_attributes"].each_with_index do |section, index|
        image_data = section[:image_data]
        return if image_data == ""
        @project.story.sections[index].image_url = upload_image(image_data)
      end
    end

    def upload_reward_images
      @params["rewards_attributes"].each_with_index do |reward, index|
        image_data = reward[:image_data]
        return if image_data == ""
        @project.rewards[index].image_url = upload_image(image_data)
      end 
    end

    def upload_image(image_data)
      tries = 3
      begin
        response = Cloudinary::Uploader.upload(image_data, options = {})
      rescue
        tries -= 1
        if tries > 0
          retry
        else
          logger.info "Failed to Upload to Cloudinary"
        end
      ensure
        return response && response["secure_url"]
      end
    end

  end
end