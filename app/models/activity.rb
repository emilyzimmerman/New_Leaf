class Activity < ApplicationRecord

    has_and_belongs_to_many :categories 
    
    
    validates :name, presence: true, length: {minimum: 2, maximum: 200}
    validates :description, presence: true, length: {minimum: 2, maximum: 400}

    validate :image_path_exists

    def image_path_exists
        
        require 'open-uri'

        begin
            #is url valid 
            #if thrown and exception then rescue will execute 
            path = URI.open(image_path)
            #is response type content image? 
            errors.add(:image_path, "Does not contain image content.") and return unless path.content_type.starts_with?("image")
            
        rescue 
            errors.add(:image_path, "Invalid URL")
        end
    end
end
