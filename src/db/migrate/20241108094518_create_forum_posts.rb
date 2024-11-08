class CreateForumPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :forum_posts do |t|
      t.string :post_topic
      t.text :post_text
      t.text :comments

      t.timestamps
    end
  end
end
