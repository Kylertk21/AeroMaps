class AddPilotProfileToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :pilot_profiles, null: false, foreign_key: true
  end
end
