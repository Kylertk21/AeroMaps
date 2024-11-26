class Comment < ApplicationRecord
  belongs_to :forum_post
  belongs_to :pilot_profile, class_name: 'PilotProfile', foreign_key: 'pilot_profiles_id', optional: true
  validates :body, presence: true
end
