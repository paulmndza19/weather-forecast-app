class HomeController < ApplicationController
  def index
  end

  def search
    weather_data = FetchWeatherService.call(city: params[:city])

    if weather_data.nil?
      render html: "<span class='text-gray-800 dark:text-white font-bold'>City not found </span>".html_safe
      return
    end

    render partial: "/home/partials/weather_content", locals: {
      weather_data: weather_data,
    }
  end
end
