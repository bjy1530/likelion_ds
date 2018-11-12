class Post < ApplicationRecord
    resourcify
    include Authority::Abilities
    
    belongs_to :user
   
    has_many :likes
    has_many :comments
    def self.search(query)
        self.where("category LIKE ?","%#{query}%")
    end
end
