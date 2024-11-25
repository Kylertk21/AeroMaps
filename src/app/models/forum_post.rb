class ForumPost < ApplicationRecord
    belongs_to :pilot_profile, optional:true
    has_many :comments, dependent: :destroy
    validates :post_topic, presence: true
    validates :post_text, presence: true
end
