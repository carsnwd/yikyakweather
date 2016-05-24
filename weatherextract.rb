require 'forecast_io'

ForecastIO.configure do |configuration|
  configuration.api_key = '16e00305725189eb6eff8d1c87cbc886'
end

forecast = ForecastIO.forecast(40.0506, -77.5203)
puts forecast.currently.icon