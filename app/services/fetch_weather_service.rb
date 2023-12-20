# frozen_string_literal: true
class FetchWeatherService
  class << self
    def call(city:)
      geocode = GetGeoCodeService.retrieve_city_geo_code(city: city)
      return if geocode.nil?

      uri = URI.parse(ENV.fetch("OPEN_WEATHER_API_ENDPOINT", "https://api.openweathermap.org/data/2.5/weather"))
      params = { appid: ENV.fetch("OPEN_WEATHER_API_KEY"), lon: geocode[:lon], lat: geocode[:lat], units: "metric" }
      uri.query = URI.encode_www_form(params)

      request = Net::HTTP::Get.new(
        uri,
        {
          "Content-Type" => "application/json",
        }
      )

      call_endpoint(uri, request)
    end

    def call_endpoint(uri, request)
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        http.request(request)
      end
      JSON.parse(response.body, object_class: OpenStruct)
    end
  end
end
