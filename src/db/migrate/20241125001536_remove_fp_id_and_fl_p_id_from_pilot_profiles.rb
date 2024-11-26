class RemoveFpIdAndFlPIdFromPilotProfiles < ActiveRecord::Migration[7.1]
  def change
    remove_column :pilot_profiles, :forum_posts_id 
    remove_column :pilot_profiles, :flight_plans_id
  end
end
