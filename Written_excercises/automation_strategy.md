# Hands-On 3 – Test Automation Process, Lifecycle & Framework Types

## Task 1

### Question 17

#### Criteria for Selecting Test Cases for Automation

1. Repetitive Test Cases
Test cases that are executed frequently should be automated.

2. Regression Test Cases
Tests that need to be executed after every code change are suitable for automation.

3. Stable Features
Features that do not change often are good candidates for automation.

4. Data-Driven Test Cases
Tests that require multiple sets of input data can be automated easily.

5. Time-Consuming Test Cases
Test cases that take a long time to execute manually should be automated.

### Question 18

| Test Case | Automation / Manual | Reason |
|-----------|---------------------|--------|
| Login functionality | Automation | It is executed frequently and is suitable for regression testing. |
| CAPTCHA verification | Manual | CAPTCHA requires human interaction and cannot be automated reliably. |
| Course creation with valid data | Automation | This is a repetitive test case and can be executed with different input data. |
| User Interface (UI) appearance | Manual | Visual appearance and user experience are better verified manually. |
| API response validation | Automation | API responses can be validated quickly and accurately using automation scripts. |

### Question 19

#### Automation ROI

**Formula:**

ROI = (Savings - Automation Cost) / Automation Cost × 100

**Example:**

- Automation Cost = $1000
- Savings = $3000

ROI = (3000 - 1000) / 1000 × 100

ROI = 200%

**Conclusion:**

The automation project has a positive ROI because the savings are greater than the automation cost. Therefore, automation is beneficial.

### Question 20

#### Flaky Test

A flaky test is a test that sometimes passes and sometimes fails even though the application code has not changed.

#### Ways to Prevent Flaky Tests

1. Use Explicit Waits instead of time.sleep().

2. Use stable and reliable locators such as ID or Name instead of dynamic XPath.

3. Keep the test environment consistent and ensure test data is stable.

## Task 2

### Question 21

#### 1. Linear Framework
Test scripts are executed in a fixed sequence. It is simple and suitable for small projects.

#### 2. Modular Framework
The application is divided into small modules and separate test scripts are created for each module.

#### 3. Data-Driven Framework
Test data is stored separately (Excel, CSV, or database) and the same test script is executed with different input data.

#### 4. Keyword-Driven Framework
Test cases are executed based on predefined keywords such as Login, Click, Enter Text, and Verify.

#### 5. Hybrid Framework
Hybrid Framework combines the features of Modular, Data-Driven and Keyword-Driven frameworks. It is flexible, reusable and suitable for large projects.

### Question 22

#### Best Framework Recommendation

The Hybrid Framework is the best choice for the Course Management API project.

Reasons:
- It combines the advantages of Modular, Data-Driven and Keyword-Driven frameworks.
- It improves code reusability and maintenance.
- It supports multiple test scenarios with different test data.
- It is suitable for medium and large automation projects.

### Question 23

#### Hybrid Framework Folder Structure

AutomationFramework/
│── tests/
│── pages/
│── test_data/
│── utilities/
│── reports/
│── screenshots/
│── conftest.py
│── requirements.txt

#### Folder Description

- tests/ – Contains all test scripts.
- pages/ – Contains Page Object Model (POM) classes.
- test_data/ – Stores test data such as Excel or CSV files.
- utilities/ – Contains reusable utility functions.
- reports/ – Stores test execution reports.
- screenshots/ – Stores screenshots of failed test cases.
- conftest.py – Contains pytest fixtures and setup.
- requirements.txt – Lists all required Python packages.