class Api::V1::WeatherController < ApplicationController
  SECONDS_TO_HOURS_MULTIPLER = 3.6

  def search
    weather_data = FetchWeatherService.call(city: params[:city])

    if weather_data.nil?
      render json: { error: "City not found" }
      return
    end

    render json: {
      city: weather_data.name,
      weather: weather_data.weather.first.main,
      description: weather_data.weather.first.description,
      temperature: "#{weather_data.main.temp} °C",
      humidity: "#{weather_data.main.humidity}%",
      wind_speed: "#{weather_data.wind.speed * SECONDS_TO_HOURS_MULTIPLER}hm/hr",
    }
  end
end
