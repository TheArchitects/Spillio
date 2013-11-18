Feature: Request to join an existing group
  As a student
  I want to request to join an existing group
  So that I can form a project group

  Background: I am on the Search for Students page
    Given I am logged in as Jalal
    And the following users exist:
    |name  |skills  |courses  |section  |interest  |
    |Megumi|Java    |CS162    |100      |Sports    |
    |Kevin |C       |CS150    |100      |Games     |
    |Alfonso|Ruby   |CS154    |101      |Reading   |
    And I am on the Search for Students page

  Scenario: Send a request to someone who is not in a group
    Given I am on the Search for Students page
    And I click on "Jalal" in the list of students
    Then I should be on the View Profile Page for "Jalal"
    Then I click on "Join Jalal"
    Then I should be on "Request Sent Page"
    And I should see "Request Sent to Jalal"

  Scenario: Send a request to someone who is in an existing group
    Given I am on the Search for Students page
    And I click on "Jalal" in the list of students
    Then I should be on the View Profile Page for Jalal
    Then I click on "Join My Group"
    Then I should be on "Request Sent Page"
    And I should see "Request Sent"
