# frozen_string_literal: true
require "net/https"

class GetGeoCodeService
  class << self
    def retrieve_city_geo_code(city:)
      begin
        uri = URI.parse(ENV.fetch("OPEN_WEATHER_API_GEO_ENDPOINT", "http://api.openweathermap.org/geo/1.0/direct"))
        params = { appid: ENV.fetch("OPEN_WEATHER_API_KEY", nil), q: city, limit: 1 }
        uri.query = URI.encode_www_form(params)

        request = Net::HTTP::Get.new(
          uri,
          {
            "Content-Type" => "application/json",
          }
        )

        result = call_endpoint(uri, request)

        return { lon: result&.first.lon, lat: result&.first.lat }
      rescue
        return nil
      end
    end

    private

    def call_endpoint(uri, request)
      response = Net::HTTP.start(uri.host, uri.port) do |http|
        http.request(request)
      end
      JSON.parse(response.body, object_class: OpenStruct)
    end
  end
end
