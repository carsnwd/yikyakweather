# Yik Yak Weather

A Ruby script using Selenium and (eventually) Forecast.io to post the weather daily on my local YikYak board. The post in the end will contain various emjois like :sunny: for sunny or :umbrella: for raining. 

# Instructions

Requires the following gems

Sellenium: https://rubygems.org/gems/selenium-webdriver/versions/2.53.0
Forecast.io: https://github.com/darkskyapp/forecast-ruby

You must also have a Firefox web browser installed. Within this browser, you must also manually set up your Yikyak account with the browser. To do this, go to yikyak.com and click login. It will then instruct you on how to setup your account. You must also make sure to select the option to stay logged in, so the script can bypass the verification process.

To change the location from Shippensburg,PA, you must change the coordinates of the paramaters on line 52.
	forecast = ForecastIO.forecast(LATITUDE, LONGITUDE)
The coordinates must be in Decimal Degrees format, you can use this tool to convert the coordinates to that: https://www.fcc.gov/media/radio/dms-decimal

# To Do
Have it run the script at a set time during the day, presumably 6AM. Whenever gem looks useful for this, look into it.
