module ProjectService
  class CreateProject < Service
    
    TYPES = {
      'project' => Project,
      'story' => Story,
      'rewards' => Reward,
      'links' => Link,
      'faqs' => Faq,
      'events' => Event 
    }

    def initialize(params)
      @project_id = params[:project_id]
      @type = params[:type]
      @params = params
      @result = {}
    end

    def call
      find_or_create_project
      if @type == 'project'
        @result[:status] = @project.update_attributes(permitted_params)
        perform_image_upload_callbacks
        @project.save
      else
        @model_obj = TYPES[@type].new(permitted_params)
        @model_obj.project_id = @project.id
        perform_image_upload_callbacks if @model_obj.valid?
        @result[:status] = @model_obj.save!
      end
      @result[:model] = @project
      return @result
    end

    private
    
    def find_or_create_project
      @project = Project.find_or_create_by(id: @project_id)
    end

    def permitted_params
      model_attrs = case @type
      when 'project' then project_attributes
      when 'story' then story_attributes
      end
      @params.permit(*model_attrs)
    end

    def project_attributes
      [:id, :title, :video_url, :image_url, :goal_amount, :funding_model, :start_date, :duration, :category_id]
    end

    def story_attributes
      [:id, :project_id, sections_attributes: [:id, :heading, :description]]
    end

    def perform_image_upload_callbacks
      case @type
      when 'project'
        @project.image_url = upload_image(@params[:image_data])
      when 'story'
        upload_story_images
      end
    end

    def upload_story_images
      @params["sections_attributes"].each_with_index do |section, index|
        @model_obj.sections[index].image_url = upload_image(section[:image_data])
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
        return response["secure_url"]
      end
    end

  end
end