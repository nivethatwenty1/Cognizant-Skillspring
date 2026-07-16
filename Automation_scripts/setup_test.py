"""
Selenium Components:

1. WebDriver:
- WebDriver is used to automate web browsers.
- It sends commands to the browser through the browser driver.

2. Selenium Grid:
- Selenium Grid is used to run tests on multiple browsers and multiple machines in parallel.

3. Selenium IDE:
- Selenium IDE is a browser extension used to record and playback test cases.
- It can also generate automation code.
"""

from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
import time

# Headless mode
options = Options()
options.add_argument("--headless")

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options)
# Implicit wait waits globally for elements.
# Explicit wait is preferred because it waits only for specific elements and conditions.
driver.implicitly_wait(10)

driver.maximize_window()

driver.get("https://www.lambdatest.com/selenium-playground")

print(driver.title)
print(driver.current_url)
print(driver.page_source[:200])

time.sleep(5)

driver.quit()