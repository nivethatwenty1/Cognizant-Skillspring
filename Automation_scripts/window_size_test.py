from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

driver.maximize_window()
driver.implicitly_wait(10)

driver.get("https://www.lambdatest.com/selenium-playground")

# Get current window size
print("Current Window Size:", driver.get_window_size())

# Set new window size
driver.set_window_size(1280, 800)

print("New Window Size:", driver.get_window_size())

# Consistent window size ensures the UI looks the same
# during automation and helps avoid responsive layout issues.

time.sleep(5)

driver.quit()