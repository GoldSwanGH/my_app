class Image < ApplicationRecord
    belongs_to :theme
    
    def self.theme_images(theme_id) 
        select('id','name','file','ave_value').where(theme_id: theme_id)
    end

    def next
        next_image = theme.images.where('id > ?', self.id).order(id: :asc).first
        next_image ||= theme.images.order(id: :asc).first  # If no image with ID greater, get the image with the smallest ID
    end
    
    def prev
        prev_image = theme.images.where('id < ?', self.id).order(id: :desc).first
        prev_image ||= theme.images.order(id: :desc).first  # If no image with ID smaller, get the image with the largest ID
    end
end