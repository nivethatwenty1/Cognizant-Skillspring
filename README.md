# Selenium Automation Project

## Overview
This project demonstrates Selenium automation using Python, Pytest and the Page Object Model (POM).

## Features
- Selenium WebDriver
- Pytest Framework
- Fixtures
- Parameterized Tests
- HTML Reports
- Screenshot on Failure
- Page Object Model (POM)

## Q59 - Page Object Model (POM) Benefit

In a normal Selenium script, if the Submit button ID changes from `submit` to `btn-submit`, every test file that uses that locator must be updated.

In the Page Object Model (POM), all locators are stored inside the page classes. If the locator changes, only the locator in the page class needs to be updated. The test files do not need any changes.

### Benefits of POM
- Easy to maintain
- Reusable code
- Better readability
- Reduced code duplication
