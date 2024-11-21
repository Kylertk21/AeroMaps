class ForumPost < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :post_topic, presence: true
    validates :post_text, presence: true
end
