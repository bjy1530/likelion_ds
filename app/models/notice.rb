class Notice < ApplicationRecord
    resourcify
    include Authority::Abilities
    has_many :comments
    belongs_to :user
    
    def self.search(query)
        self.where("title || content LIKE ?","%#{query}%")
    end
end
