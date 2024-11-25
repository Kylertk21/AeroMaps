class AddPilotProfilesIdToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :pilot_profiles, null: false, foreign_key: true
  end
end
