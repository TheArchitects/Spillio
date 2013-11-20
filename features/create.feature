Feature: create a profile with my information
  As a student
  I want to make my info (skills, personal, interests, section #) visible to other students
  So that I can market myself to other students who may join my group

Background: I am on the Create New Profile page
  Given I am logged in
  And I am on the Create New Student Profile page

Scenario: Enter in user information
  Given I fill in "Name" with "Jalal"
  And I select "101" from "student_section_id"
  And I fill in "Interest" with "Running"
  And I fill in "Description:" with "I am a test student"
  And I press "Save"
  Then I should be on the New User Profile page
  And I should see "Jalal"
  And I should see "Java"
  And I should see "Running"
  And I should see "I am a test student"
