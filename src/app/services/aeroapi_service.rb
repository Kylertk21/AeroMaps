require 'httparty'

class AeroapiService
    API_KEY = 'OrqFcVkNyMM9zNdMGo1yWHcPsizuZMOe'
    BASE_URL = 'https://aeroapi.flightaware.com/aeroapi'
    LOGGER = Logger.new(STDOUT)

    def self.fetch_metar(icao_code)
        url = "#{BASE_URL}/airports/#{icao_code}/weather/observations"
        LOGGER.info("Sending request to AeroApi: #{url}")

        response = HTTParty.get(
            url, 
            headers: { 
                "Accept" => "application/json; charset=UTF-8",
                "x-apikey" => API_KEY 
            }
        )
        
        LOGGER.info("Response Code: #{response.code}")
        LOGGER.info("Response Body: #{response.body}")

        return response.parsed_response if response.code == 200
        nil 
    end
end