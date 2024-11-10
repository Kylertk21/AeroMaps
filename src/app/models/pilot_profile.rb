class PilotProfile < ApplicationRecord
    validates :first_name, :last_name, :aircraft_ident, :aircraft_type,
    :home_address, :phone_number, :bio, presence: true
    
    has_many :flight_plans
    has_many :forum_posts
end
