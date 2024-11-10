class WeatherController < ApplicationController
  before_action :authenticate_user!
  def show 
    icao_code = "KCOS"
    @metar_data = AeroapiService.fetch_metar(icao_code)
  end
end
