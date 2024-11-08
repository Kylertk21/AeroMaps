json.extract! flight_plan, :id, :departure, :time_of_departure, :route, :cruising_altitude, :true_airspeed, :first_landing, :time_until_first, :fuel_hours, :number_of_passengers, :extra_info, :created_at, :updated_at
json.url flight_plan_url(flight_plan, format: :json)
