Feature: create a profile with my information
  As a student
  I want to make my info (skills, personal, interests, section #) visible to other students
  So that I can market myself to other students who may join my group

Background: I am on the Create New Profile page

  Given I am on the Create New Profile page

Scenario: Enter in user information
  Given I fill in "Name" with "Jalal"
  And I check "Java"
  And I check "CS162"
  And I select "101" from "student_section_id"
  And I fill in "Interest" with "Running"
  And I press "Create profile"
  Then I should be on the New User Profile page
  And I should see "Jalal"
  And I should see "Java"
  And I should see "CS162"
  And I should see "101"
  And I should see "Running"
