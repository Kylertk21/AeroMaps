class AddUserIdToPilotProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :pilot_profiles, :user_id, :integer
    add_index :pilot_profiles, :user_id
  end
end
