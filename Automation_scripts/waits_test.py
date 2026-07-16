from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.support.wait import WebDriverWait

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

driver.maximize_window()

# Open Selenium Playground
driver.get("https://www.lambdatest.com/selenium-playground")

# Open Bootstrap Alerts Demo
driver.find_element(By.LINK_TEXT, "Bootstrap Alerts").click()

# Click Success Message button
driver.find_element(By.XPATH, "//button[contains(text(),'Success Message')]").click()           

# Wait until success alert becomes visible
wait = WebDriverWait(driver, 10)
alert = wait.until(
    EC.visibility_of_element_located(
        (By.XPATH, "//div[contains(@class,'alert-success')]")
    )
)

print("Alert Text:", alert.text)

# Verify alert contains 'successfully'
assert "success" in alert.text.lower()

print("Q36 Completed Successfully")

import time

# Q37 - Compare time.sleep() vs Explicit Wait

# Using time.sleep()
start = time.time()

driver.get("https://www.lambdatest.com/selenium-playground")
driver.find_element(By.LINK_TEXT, "Bootstrap Alerts").click()
driver.find_element(By.XPATH, "//button[contains(text(),'Success Message')]").click()

time.sleep(3)

end = time.time()
print("Time using sleep():", end - start, "seconds")

# Using Explicit Wait
start = time.time()

driver.get("https://www.lambdatest.com/selenium-playground")
driver.find_element(By.LINK_TEXT, "Bootstrap Alerts").click()
driver.find_element(By.XPATH, "//button[contains(text(),'Success Message')]").click()

wait = WebDriverWait(driver, 10)
wait.until(
    EC.visibility_of_element_located(
        (By.XPATH, "//div[contains(@class,'alert-success')]")
    )
)

end = time.time()
print("Time using Explicit Wait:", end - start, "seconds")

# Explicit Wait is better because it waits only until the element appears.
# time.sleep() always waits for the full specified time, making tests slower.

# Q38 - Wait for element to be clickable

driver.get("https://www.lambdatest.com/selenium-playground")

driver.find_element(By.LINK_TEXT, "Bootstrap Alerts").click()

wait = WebDriverWait(driver, 10)

button = wait.until(
    EC.element_to_be_clickable(
        (By.XPATH, "//button[contains(text(),'Success Message')]")
    )
)

button.click()

print("Q38 Completed Successfully")

# visibility_of_element_located:
# Element is visible on the page.

# element_to_be_clickable:
# Element is visible and enabled, so it can be clicked.

# Q39 - Fluent Wait

driver.get("https://www.lambdatest.com/selenium-playground")

wait = WebDriverWait(
    driver,
    timeout=10,
    poll_frequency=0.5,
    ignored_exceptions=[NoSuchElementException]
)

try:
    element = wait.until(
        lambda d: d.find_element(By.TAG_NAME, "body")
    )
    print("Q39 Completed Successfully")
except:
    print("Element not found")

driver.quit()