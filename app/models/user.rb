class User < ApplicationRecord
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :reviews
  
  after_create :set_default_role, if: Proc.new { User.count > 1 }

  private

  def set_default_role
    add_role :user
  end
end
