class CreatePilotProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :pilot_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :aircraft_ident
      t.string :aircraft_type
      t.string :home_address
      t.integer :phone_number
      t.text :bio

      t.timestamps
    end
  end
end
