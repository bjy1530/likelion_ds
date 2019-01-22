class Review < ApplicationRecord
  belongs_to :user
    mount_uploader :image, ReviewImageUploader
    mount_uploader :image2, ReviewImageUploader
    mount_uploader :image3, ReviewImageUploader
    mount_uploader :image4, ReviewImageUploader
    def self.search(query)
        self.where("category LIKE ?","%#{query}%")
    end
end
