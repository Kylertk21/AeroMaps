class RenameForumPostsIdToForumPostIdInComments < ActiveRecord::Migration[7.1]
  def change
    rename_column :comments, :forum_posts_id, :forum_post_id

    if foreign_key_exists?(:comments, column: :forum_posts_id)
      remove_foreign_key :comments, column: :forum_posts_id
    end 

    add_foreign_key :comments, :forum_posts, column: :forum_post_id 

  end
end
