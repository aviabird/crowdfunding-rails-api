module ProjectService
  class UpdateProject < Service
    
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
      find_project
      perform_image_upload_callbacks
      @result[:status] = @project.save
      @result[:model] = @project
      return @result
    end

    private
    
    def find_project
      @project = Project.find_by(id: @params[:id])
      @project.attributes = permitted_params
    end

    def permitted_params
      @params.permit(*project_attributes)
    end

    def project_attributes
      [
        :id, :title, :video_url, :pledged_amount, :funding_model, :start_date, :duration, :category_id, :currency,
        pictures_attributes: [:id, :url, :_destroy],
        rewards_attributes: [:id, :title, :description, :amount, :_destroy, :delivery_date, :quantity, :currency],
        story_attributes: [:id, :body ],
        faqs_attributes: [:id, :question, :answer, :_destroy],
        links_attributes: [:id, :url, :_destroy],
        events_attributes: [:id, :title, :country, :date, :image_url, :description]
      ]  
    end

    def perform_image_upload_callbacks
      case @type
      when 'project'
        upload_project_images
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

  end
end