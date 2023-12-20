class HomeController < ApplicationController
  def index
  end

  def search
    weather_data = FetchWeatherService.call(city: params[:city])

    render partial: "/home/partials/weather_content", locals: {
      weather_data: weather_data,
    }
  end
end
