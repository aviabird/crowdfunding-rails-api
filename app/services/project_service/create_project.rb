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
        :id, :title, :video_url, :image_url, :goal_amount, :funding_model, :duration, :category_id,
        rewards_attributes: [:id, :title, :description, :image_url, :amount],
        story_attributes: [:id, sections_attributes: [:id, :heading, :description] ],
        faqs_attributes: [:id, :question, :answer],
        links_attributes: [:id, :url],
        events_attributes: [:id, :title, :country, :date, :image_url, :description]
      ]  
    end

    def perform_image_upload_callbacks
      case @type
      when 'project'
        @project.image_url = upload_image(@params[:image_data])
      when 'story'
        upload_story_images
      when 'reward'
        upload_reward_images
      end
    end

    def upload_story_images
      @params["story_attributes"]["sections_attributes"].each_with_index do |section, index|
        @project.story.sections[index].image_url = upload_image(section[:image_data])
      end
    end

    def upload_reward_images
      @params["rewards_attributes"].each_with_index do |reward, index|
        @project.rewards[index].image_url = upload_image(reward[:image_data])
      end 
    end

    def upload_image(image_data)
      return if image_data == ""
      
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