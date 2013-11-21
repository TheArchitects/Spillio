Feature: Submit assignments online
  As a student member of a group
  I want to be able to submit files as a response to assignments
  So that my teachers can grade them

  Background: I am a logged in student in my group dashboard
    Given settings set
    Given the following task exists:
    |title  |description  |due_date  |
    |iteration1-1|features|5/1/2014  |
    |iteration1-2|features|5/8/2014  |
    And I am logged into the student group dashboard

  Scenario: Upload a file
    Given I click on "iteration1-1" under tasks
    And I fill in "description" with "This is our iteration 1-1."
    And I fill in "file to upload" with "iteration1-1.zip"
    And I press "Submit"
    Then I should see "Assignment Submitted Successfully!"

  Scenario: Upload a link
    Given I click on "iteration1-2" under tasks
    And I fill in "description" with "This is our deployed iteration 1-2."
    And I select "Heroku Link" from the "Link Type" drop down menu
    And I fill in "link" with "https://cool-webapp.heroku.com"
    And I press "Submit"
    Then I should see "Assignment Submitted Successfully!"

  Scenario: Upload nothing and attempt to submit my assignment
    Given I click on "iteration1-1" under tasks
    And I fill in "description" with "This is our iteration 1-1."
    And I press "Submit"
    Then I should see "Error: You must select a file or provide a link"
