class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validate :email_format
         def email_format
             unless email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
                 errors.add(:email, "must be a valid email address")
             end
         end
      
end
