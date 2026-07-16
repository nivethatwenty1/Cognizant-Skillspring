# Hands-On 2 – SDLC vs TDLC – V-Model & Agile QA Integration

## Task 1

### Question 9

#### V-Model Diagram

Requirements                 ↔ Acceptance Testing

System Design                ↔ System Testing

Architecture Design          ↔ Integration Testing

Module Design                ↔ Unit Testing

Coding

#### Explanation

The V-Model is a software development model where each development phase has a corresponding testing phase.

- Requirements are verified by Acceptance Testing.
- System Design is verified by System Testing.
- Architecture Design is verified by Integration Testing.
- Module Design is verified by Unit Testing.
- Coding is performed before all testing activities begin.

### Question 10

| SDLC Phase | TDLC Phase | Test Artifact Produced |
|------------|------------|------------------------|
| Requirements | Acceptance Testing | Acceptance Test Plan |
| System Design | System Testing | System Test Plan |
| Architecture Design | Integration Testing | Integration Test Plan |
| Module Design | Unit Testing | Unit Test Cases |
| Coding | Testing Execution | Developed Source Code |

### Question 11

| Testing Level | Entry Criteria | Exit Criteria |
|---------------|----------------|---------------|
| Unit Testing | Code is completed and reviewed. | All unit tests pass with no critical defects. |
| Integration Testing | All modules are integrated successfully. | Module interactions work correctly without major defects. |
| System Testing | Complete application is deployed in the test environment. | All planned system test cases are executed and critical defects are fixed. |
| Acceptance Testing | System testing is completed successfully. | The customer or end user accepts the application for release. |

### Question 12

1. **Requirements Review**
   QA should participate in the requirements review to identify unclear or missing requirements before development begins.

2. **Design Review**
   QA should participate in the system design review to understand the application flow, identify potential risks, and prepare test cases early.

## Task 2

### Question 13

#### Problems in the Waterfall Model

1. Testing starts only after development is completed, so defects are found very late.

2. Fixing defects in the later stages is more expensive and time-consuming.

3. Customer feedback is received only at the end of the project, making requirement changes difficult.

### Question 14

#### QA Role in Agile Ceremonies

**Sprint Planning:**
QA reviews requirements, defines acceptance criteria and estimates testing effort.

**Daily Standup:**
QA shares testing progress, discusses blockers and updates the team.

**Sprint Review:**
QA verifies completed features and demonstrates tested functionality.

**Retrospective:**
QA discusses testing challenges and suggests improvements for future sprints.

### Question 15

#### Shift-Left Testing Practices

1. Review requirements early to identify unclear or missing requirements.

2. Write test cases before coding using TDD or BDD.

3. Perform static code analysis to identify coding issues before execution.

4. Perform API contract testing before integrating different modules.

### Question 16

#### Acceptance Criteria (Given-When-Then)

**Scenario 1: Successful Course Creation**

Given the college admin is on the Create Course page  
When the admin enters valid course details and clicks Submit  
Then the course should be created successfully.

**Scenario 2: Duplicate Course Code**

Given a course with the same course code already exists  
When the admin submits the duplicate course code  
Then an error message should be displayed.

**Scenario 3: Missing Required Fields**

Given the admin leaves mandatory fields empty  
When the admin clicks Submit  
Then validation messages should be displayed and the course should not be created.