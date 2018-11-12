class Review < ApplicationRecord
  belongs_to :user
  
    def self.search(query)
        self.where("category LIKE ?","%#{query}%")
    end
end
