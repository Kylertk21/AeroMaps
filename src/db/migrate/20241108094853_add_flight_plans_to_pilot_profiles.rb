class AddFlightPlansToPilotProfiles < ActiveRecord::Migration[7.1]
  def change
    add_reference :pilot_profiles, :flight_plans, null: false, foreign_key:true
  end
end
