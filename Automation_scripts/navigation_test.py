from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
import time

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

driver.maximize_window()
driver.implicitly_wait(10)

# Open Selenium Playground
driver.get("https://www.lambdatest.com/selenium-playground")

# Click "Simple Form Demo"
driver.find_element(By.LINK_TEXT, "Simple Form Demo").click()

# Verify URL contains 'simple-form-demo'
assert "simple-form-demo" in driver.current_url
print("URL Assertion Passed")

# Go back to previous page
driver.back()

time.sleep(5)
driver.quit()