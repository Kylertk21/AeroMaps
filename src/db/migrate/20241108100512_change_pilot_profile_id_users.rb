class ChangePilotProfileIdUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :pilot_profiles_id, true
    change_column_null :pilot_profiles, :flight_plans_id, true
    change_column_null :pilot_profiles, :forum_posts_id, true
  end
end
