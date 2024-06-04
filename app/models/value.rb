class Value < ApplicationRecord
    belongs_to :user
    
    def self.values_by_user_for_image(user_id, image_id) 
        select('value').where(image_id: image_id, user_id: user_id)
    end
end
