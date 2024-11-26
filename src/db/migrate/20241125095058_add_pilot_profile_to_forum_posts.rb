class AddPilotProfileToForumPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :forum_posts, :pilot_profile, null: false, foreign_key: true
  end
end
