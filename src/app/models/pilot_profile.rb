class PilotProfile < ApplicationRecord
    belongs_to :user # 1-1 relationship with a user
    validates :first_name, :last_name, :aircraft_ident, :aircraft_type,
    :home_address, :phone_number, :bio, presence: true
    
    has_many :flight_plans
    has_many :forum_posts
    validates :user, presence: true # Ensures user is always associated with profile
end
