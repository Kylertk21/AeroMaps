json.extract! pilot_profile, :id, :first_name, :last_name, :aircraft_ident, :aircraft_type, :home_address, :phone_number, :bio, :created_at, :updated_at
json.url pilot_profile_url(pilot_profile, format: :json)
