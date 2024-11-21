class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_one :pilot_profile, dependent: :destroy # user can only have on pilot_profile
         validate :email_format                      # destroys if user is deleted
         def email_format
             unless email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
                 errors.add(:email, "must be a valid email address")
             end
         end
      
end
