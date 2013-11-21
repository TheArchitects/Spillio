Feature: Request to join an existing group
  As a student
  I want to request to join an existing group
  So that I can form a project group

  Background: I am on the Search for Students page
    Given I am logged in
    And the following users exist:
    |name  | about| group_id|
    |Megumi|  about|        |
    |Kevin |  about|        |
    |Alfonso| about|        |

    Given I am on the Create New Student Profile page
    Given I fill in "Name" with "Jalal"
    And I select "101" from "student_section_id"
    And I fill in "Interest" with "Running"
    And I fill in "Description:" with "I am a test student"
    And I press "Save"

  Scenario: Send a request to someone who is not in a group
    Given I am on the Search for Students Page
    Given I click on "Megumi" in the list of students
    Then I should be on the View Profile Page for "Megumi"
    Then I press "join"
    And I should see "Request Sent to Megumi"

  Scenario: Send a request to someone who is in an existing group
    Given I am on the Search for Students Page
    And I click on "Jalal" in the list of students
    Then I should be on the View Profile Page for Jalal
    Then I click on "Join My Group"
    Then I should be on "Request Sent Page"
    And I should see "Request Sent"
