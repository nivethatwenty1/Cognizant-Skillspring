from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

driver.maximize_window()
driver.implicitly_wait(10)

# Open Selenium Playground
driver.get("https://www.lambdatest.com/selenium-playground")

# Open Google in a new tab
driver.execute_script('window.open("https://www.google.com");')

# Switch to Google tab
driver.switch_to.window(driver.window_handles[1])
print(driver.title)

# Switch back to Selenium Playground
driver.switch_to.window(driver.window_handles[0])

# Take screenshot
driver.save_screenshot("playground_screenshot.png")
print("Screenshot saved successfully")

time.sleep(5)

driver.quit()