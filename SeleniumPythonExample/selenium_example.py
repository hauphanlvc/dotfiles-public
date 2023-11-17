from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
import time

# Set up the Selenium driver with desired capabilities
chrome_options = Options()
# chrome_options.add_argument("--headless")  # Run Chrome in headless mode
# driver = webdriver.Remote(
#     command_executor='http://localhost:4444/wd/hub',
#     options=chrome_options
# )
driver = webdriver.Chrome(options=chrome_options)
# Open Google
driver.get("https://www.google.com")

# Find the search input and enter a search term
search_input = driver.find_element("name", "q")
search_input.send_keys("example search term")
search_input.send_keys(Keys.RETURN)

# Print the page title
print("Page title:", driver.title)

# Quit the driver
driver.quit()
