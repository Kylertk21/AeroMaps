class CreateFlightPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :flight_plans do |t|
      t.string :departure
      t.time :time_of_departure
      t.string :route
      t.integer :cruising_altitude
      t.integer :true_airspeed
      t.string :first_landing
      t.integer :time_until_first
      t.integer :fuel_hours
      t.integer :number_of_passengers
      t.text :extra_info

      t.timestamps
    end
  end
end
