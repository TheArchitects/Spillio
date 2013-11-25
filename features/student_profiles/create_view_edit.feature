Feature: create a profile with my information
  As a student
  I want to make my info (skills, personal, interests, section #) visible to other students
  So that I can market myself to other students who may join my group

Background: I am on the Create New Profile page
  Given settings set

Scenario: Create new user and View user information
  Given I am logged in with cid "12345"
  Given I am on the Create New Student Profile page
  And I fill in "Name" with "Jalal"
  And I select "101" from "student_section_id"
  And I fill in "Interest" with "Running"
  And I fill in "Description:" with "I am a test student"
  And I press "Save"
  Then I should be on the New User Profile page for "Jalal"
  And I should see "Jalal"
  And I should see "Java"
  And I should see "Running"
  And I should see "I am a test student"

Scenario: Edit user information
  Given I am logged in with cid "111111"

  Given I am on the Create New Student Profile page
  And I fill in "Name" with "Kayvan"
  And I select "101" from "student_section_id"
  And I fill in "Interest" with "Nothing"
  And I fill in "Description:" with "I am a test student"
  And I press "Save"

  Given I am on the Edit Student Profile page of "Kayvan"
  And I fill in "Interest" with "Some Thing"
  And I press "Save"
  Then I should be on the User Profile page of "Kayvan"
  And I should see "Some Thing"

