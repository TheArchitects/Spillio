Feature: create a profile with my information
  As a student
  I want to make my info (skills, personal, interests, section #) visible to other students
  So that I can market myself to other students who may join my group

Background: I am on the Spillio home page

  Given I am on the Spillio home page
  And I am not logged in
  And user "Jalal" has no existing profile

Scenario: Login using Calnet for the first time
  When I login to Calnet as "Jalal"
  Then I should be on the "Create User Profile" page
  
Scenario: Enter in user information
  When I have logged in as "Jalal"
  And I am on the "Create User Profile" page
  And I have entered in "Java,C" for "Skills"
  And I have entered in "CS169,CS186" for "Current Courses"
  And I have entered in "CS162,CS161" for "Past Courses"
  And I have entered in "2" for "Section Number"
  And I have entered in "Running" for "Interests"
  And I click "Save"
  Then I should be on the "View User Profile" page
  And I should see "Jalal" listed as "Name"
  And I should see "Java,C" listed as "Skills"
  And I should see "CS169,CS186" listed as "Current Courses"
  And I should see "CS162,CS161" listed as "Past Courses"
  And I should see "2" listed as "Section number"
  And I should see "Running" listed as "Interests"
  And I should see "Free on weekends" listed as "Notes to Classmates"
  And I should see a button for "Edit my information"

Scenario: The user forgets to enter in "Section Number"
  When I have logged in as "Jalal"
  And I am on the "Create User Profile" page
  And I have entered in "Java,C" for "Skills"
  And I click "Save"
  Then I should be on the "Create User Profile" page
  And the "Section number" field should have the error "You must enter your Section Number"
  And I should see "Jalal" listed as "Name"
  And I should see "Java,C" listed as "Skills"

Scenario: The user forgets to enter in "Skills"
  When I have logged in as "Jalal"
  And I am on the "Create User Profile" page
  And I have entered in "2" for "Section Number"
  And I click "Save"
  Then I should be on the "Create User Profile" page
  And the "Skills" field should have the error "You must enter your Skills"
  And I should see "Jalal" listed as "Name"
  And I should see "2" listed as "Section Number"