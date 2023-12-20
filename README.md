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
6. Visit `http://localhost:3000`.
7. On the input, type a city that you wish to get the weather data then press the `Search` button.
8. It will show you the current weather data for the city that you searched.

* To Improve
  - Tailwind and HTMX dependencies are currently being loaded into the app using CDN which is not recommended in production use.