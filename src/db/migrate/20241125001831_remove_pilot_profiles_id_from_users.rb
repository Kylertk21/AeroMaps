class RemovePilotProfilesIdFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :pilot_profiles_id
  end
end
