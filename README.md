# README

This is a simple weather monitoring app written in [Ruby on Rails](https://rubyonrails.org/), [TailwindCSS](https://tailwindcss.com/), and [OpenWeatherMap API](https://openweathermap.org/api/).

* Ruby version:
```3.0.0```

* Rails version:
`Rails 7.0.8`

* Setup instructions
1. Install ruby `3.0.0` depending on your choice of version manager (rvm, rbenv, asdf).
2. Clone the repository:
``` git clone git@github.com:paulmndza19/weather-forecast-app.git ```
3. Create a `.env` file with the values
  - `OPEN_WEATHER_API_KEY` (required) - your OpenWeatherMap API key. For more information visit [OpenWeatherMap docs](https://openweathermap.org/api/).
  - `OTEL_TRACES_EXPORTER` (only required for OpenTelemetry usage) - this tells where we export our system data from OpenTelemetry. Accepted values are (console, otlp, zipkin, logging). For more information visit [OpenTelemetry Docs](https://opentelemetry.io/docs/specs/otel/configuration/sdk-environment-variables/).
4. Run `bundle install`
5. Start the rails server using this command `rails s`
6. Visit `http://localhost:3000/api/v1/search?city=<city name>`. Here is a sample of the API response.

      ```
        {
          "city":"New York",
          "weather":"Clear",
          "description":"clear sky",
          "temperature":"0.82 °C",
          "humidity":"59%",
          "wind_speed":"20.376hm/hr"
        }
      ```