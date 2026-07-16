# Hands-On 1 – QA Concepts & Defect Lifecycle

## Task 1

### Question 1

#### Unit Testing
Unit Testing checks a single function or method in isolation.
Example: Verify that the create_course() function creates a new course successfully when valid course details are provided.

#### Integration Testing
Integration Testing checks whether two or more components work together correctly.
Example: Verify that the POST/api/courses endpoint stores the course data correctly in the database.

#### System Testing
System Testing verifies the complete application from start to end.
Example: Verify that when a user sends a request to create a course, the course is saved in the database and a success response (201 Created) is returned.

#### User Acceptance Testing (UAT)
User Acceptance Testing verifies whether the application meets the user's business requirements.
Example: Verify that a college admin can successfully create a new course and view it in the course list.

### Question 2

#### Functional Testing
Functional Testing verifies whether the application works according to the specified requirements.
Example: Verify that the POST/api/courses endpoint creates a new course successfully when valid data is provided.

#### Non-Functional Testing
Non-Functional Testing verifies how well the application performs in terms of performance, security, reliability and usability.

Example:
Performance Testing – Verify that the Course Management API can handle 1000 user requests within an acceptable response time.

### Question 3

#### Black-Box Testing
Black-Box Testing is a testing method where the tester verifies the application's functionality without knowing the internal code or implementation.
Example: A QA tester checks whether the Course Management API returns the correct response for valid and invalid inputs.

#### White-Box Testing
White-Box Testing is a testing method where the tester has knowledge of the internal code, logic and structure of the application.
Example: A developer tests the create_course() function by checking all code paths and conditions.

#### Difference
- Black-Box Testing focuses on the application's functionality without looking at the code.
- White-Box Testing focuses on the internal code and program logic.

#### Who Performs It?
- QA Tester: Usually performs Black-Box Testing.
- Developer: Usually performs White-Box Testing.

### Question 4

| Test Case ID | Description | Preconditions | Test Steps | Expected Result | Actual Result | Pass/Fail |
|--------------|-------------|---------------|------------|-----------------|---------------|-----------|
| TC_001 | Verify course is created with valid details | API is running | 1. Send POST request with valid course details.<br>2. Click Send. | Course is created successfully and status code 201 is returned. | | |
| TC_002 | Verify course is not created with missing required fields | API is running | 1. Send POST request without course name.<br>2. Click Send. | Error message is displayed and status code 400 is returned. | | |
| TC_003 | Verify duplicate course code is not allowed | API is running | 1. Create a course with a course code.<br>2. Send another POST request with the same course code. | Duplicate course is rejected with an appropriate error message. | | |

## Task 2 

### Question 5

#### Defect Lifecycle

New → Assigned → Open → Fixed → Retest → Verified → Closed

**New:** A new defect is reported by the QA tester.

**Assigned:** The defect is assigned to a developer.

**Open:** The developer starts working on the defect.

**Fixed:** The developer fixes the defect and marks it as fixed.

**Retest:** The QA tester retests the application to verify the fix.

**Verified:** The QA tester confirms that the defect is fixed successfully.

**Closed:** The defect is closed because it has been fixed and verified.

**Rejected:** The developer rejects the defect if it is not a valid bug or cannot be reproduced.

**Deferred:** The defect is postponed and will be fixed in a future release.

### Question 6

### Question 6

| Bug | Severity | Priority | Justification |
|-----|----------|----------|---------------|
| POST /api/courses returns 500 Internal Server Error for all requests. | Critical | P1 | The API is completely unusable because all requests fail. It must be fixed immediately. |
| Course names longer than 150 characters are silently truncated without an error. | Medium | P3 | The application works, but data is incorrectly stored, which can affect users. |
| The /docs Swagger page has a typo in the API description. | Low | P4 | This is only a documentation issue and does not affect the functionality of the API. |
| Login with correct credentials occasionally returns 401 on the first attempt. | High | P2 | The login feature is unreliable and affects user experience, so it should be fixed soon. |

### Question 7

### Question 7

| Field | Details |
|-------|---------|
| Defect ID | BUG-001 |
| Title | POST /api/courses returns 500 Internal Server Error |
| Environment | Windows 11, Google Chrome, Course Management API |
| Build Version | v1.0 |
| Severity | Critical |
| Priority | P1 |
| Steps to Reproduce | 1. Open the Course Management API.<br>2. Send a POST request to /api/courses with valid course details.<br>3. Observe the response. |
| Expected Result | The course should be created successfully with status code 201. |
| Actual Result | The API returns 500 Internal Server Error. |
| Attachments | Screenshot of 500 Internal Server Error |

### Question 8

### Question 8

#### Severity vs Priority

Severity refers to how serious the defect is and how much it affects the system.

Priority refers to how quickly the defect should be fixed.

**Example:**

A typo on the CEO's dashboard has Low Severity because it does not affect the application's functionality. However, it can have High Priority because it is visible to important users and should be corrected before the release.