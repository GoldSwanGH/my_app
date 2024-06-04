module WorkImage
    extend ActiveSupport::Concern
    include WorkHelper
  
    # Display image by index for searched theme
    def show_image(image)
        data = {
            theme_id: image.theme.id,
            images_arr_size: image.theme.images.count,
            image_id: image.id,
            name: image.name,
            file: image.file
        }
        logger.info "In show_image:  data = #{data.inspect}"
        data
    end
  end