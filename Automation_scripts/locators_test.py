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

# Open Simple Form Demo
driver.find_element(By.LINK_TEXT, "Simple Form Demo").click()

# By ID
driver.find_element(By.ID, "user-message")
print("ID - OK")

# By Name
driver.find_element(By.NAME, "message")
print("NAME - OK")

# By Class Name
driver.find_element(By.CLASS_NAME, "form-control")
print("CLASS NAME - OK")

# By Tag Name
driver.find_element(By.TAG_NAME, "input")
print("TAG NAME - OK")

# Relative XPath
driver.find_element(By.XPATH, "//input[@id='user-message']")
print("RELATIVE XPATH - OK")

time.sleep(5)

# Open Checkbox Demo
driver.get("https://www.lambdatest.com/selenium-playground")
driver.find_element(By.LINK_TEXT, "Checkbox Demo").click()

# Find first checkbox label
label = driver.find_element(By.XPATH, "//label[text()='Option 1']")
print("First Label:", label.text)

# Find all option labels using contains()
labels = driver.find_elements(By.XPATH, "//label[contains(text(),'Option')]")

print("All Option Labels:")

seen = set()
for item in labels:
    if item.text not in seen:
        print(item.text)
        seen.add(item.text)

driver.quit()