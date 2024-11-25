class User < ApplicationRecord

    enum role: { user: 'user', admin: 'admin', super_admin: 'super_admin' }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_one :pilot_profile, dependent: :destroy
         validate :email_format                      
         def email_format
             unless email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
                 errors.add(:email, "must be a valid email address")
             end
         end

         def admin?
            role == "admin" || role == "super_admin"
         end

         def super_admin?
            role == "super_admin"
         end
end
