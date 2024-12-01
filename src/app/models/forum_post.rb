class ForumPost < ApplicationRecord
    scope :by_post_topic, ->(post_topic) { where(post_topic: post_topic) if post_topic.present? }
    belongs_to :pilot_profile, optional:true
    has_many :comments, dependent: :destroy
    validates :post_topic, presence: true
    validates :post_text, presence: true
end
