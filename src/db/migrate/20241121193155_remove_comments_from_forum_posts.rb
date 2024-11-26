class RemoveCommentsFromForumPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :forum_posts, :comments, :text
  end
end
