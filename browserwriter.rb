require 'selenium-webdriver'

default_profile = Selenium::WebDriver::Firefox::Profile.from_name "default"
default_profile.native_events = true

driver = Selenium::WebDriver.for(:firefox, :profile => default_profile)
driver.manage.timeouts.implicit_wait = 10
driver.navigate.to "https://www.yikyak.com/nearby/new"
textElement = driver.find_element(:class, "form-control")
textElement.send_keys "😆"
driver.find_element(:class, "send").click