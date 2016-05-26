=begin

@author Carson Wood
Script that uses Sellenium API and Forecast.io API
to post a weather report on the local yik yak
app for the day.

IMPORTANT: You must verify your phone number and
select to stay logged in on Yik Yak for this to
work. Otherwise, it will get stuck at the landing
page to login and verify a phone number. 

Firefox is required, used on Firefox version 46.0.1
This script was created on a Linux machine with
Ubuntu 14.04 distro. Other OS/distros are untested 
may have unpredictable results.

=end

require 'forecast_io'
require 'selenium-webdriver'

#Returns an emoji for a given weather condition
def emojiTranslator(weather_icon)
	case weather_icon
	when "clear-day", "clear-night"
		return "☀"
	when "cloudy"
		return "☁"
	when "partly-cloudy-day", "partly-cloudy-night"
		return "⛅"
	when "rain"
		return "☔"
	when "snow"
		return "❄"
	when "fog"
		return "🌁"
	when "sleet"
		return "SLEET"
	when "wind"
		return "WINDY"
	else 
		raise "SyntaxError", "Invalid icon used, no emoji can be assigned."
	end
end

#Creates the yikyak post with all the weather details
def weatherPostGenerator
	ForecastIO.configure do |configuration|
	  configuration.api_key = '16e00305725189eb6eff8d1c87cbc886'
	end

	forecast = ForecastIO.forecast(40.0506, -77.5203) #CHANGE THESE COORDINATES FOR YOUR LOCATION

	post = "Currently: " + 
			emojiTranslator(forecast.currently.icon) + " " +
			forecast.currently.temperature.floor.to_s + "°. Today: " +
			emojiTranslator(forecast.daily.icon) + 
			" " + forecast.hourly.summary + " H: " +
			forecast.daily.data[0].temperatureMax.floor.to_s + " L: " +
			forecast.daily.data[0].temperatureMin.floor.to_s + 
			" Wind: " + forecast.daily.data[0].windSpeed.floor.to_s + " mph."
	if post.length > 200
		raise "SyntaxError", "Invalid length, too long to post on Yik Yak."
	end
	return post
end

default_profile = Selenium::WebDriver::Firefox::Profile.from_name "default"
default_profile.native_events = true

driver = Selenium::WebDriver.for(:firefox, :profile => default_profile)
driver.manage.timeouts.implicit_wait = 10
driver.navigate.to "https://www.yikyak.com/nearby/new"
textElement = driver.find_element(:class, "form-control")
textElement.send_keys weatherPostGenerator
driver.find_element(:class, "send").click

# def run
# 	default_profile = Selenium::WebDriver::Firefox::Profile.from_name "default"
# 	default_profile.native_events = true

# 	driver = Selenium::WebDriver.for(:firefox, :profile => default_profile)
# 	driver.manage.timeouts.implicit_wait = 10
# 	driver.navigate.to "https://www.yikyak.com/nearby/new"
# 	textElement = driver.find_element(:class, "form-control")
# 	textElement.send_keys weatherPostGenerator
# 	driver.find_element(:class, "send").click
# end