class AddForumPostsToPilotProfile < ActiveRecord::Migration[7.1]
  def change
    add_reference :pilot_profiles, :forum_posts, null: false, foreign_key: true
  end
end
