class Post < ApplicationRecord
    resourcify
    include Authority::Abilities
    
    belongs_to :user
   
    has_many :likes
    has_many :comments
    
end
