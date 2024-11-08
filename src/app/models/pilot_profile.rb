class PilotProfile < ApplicationRecord
    has_many :flight_plans
    has_many :forum_posts
end
