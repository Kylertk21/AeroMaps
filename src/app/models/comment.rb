class Comment < ApplicationRecord
  belongs_to :forum_posts
  validates :body, presence: true
end
