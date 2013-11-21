Feature: Set number of students per group
  As a class admin
  I want to be able to set the allowed number of students per group
  So that there is a balance between the number of groups and projects

  Background: I am a logged in admin on the dashboard
    Given settings set
	  Given the following instructor exists:
	  | id | name    |
	  | 3  |Robocop |

    And I am logged in as "Robocop"

  Scenario: Set the number of students to 5
    Given I am on the dashboard
    And I click on "Group Management" in the Sidebar
    And I fill in "Group Size" with "5"
    And I press "Save"
    Then I should see "Changes Made Successfully"
    And I should see "Group Size: 5 Students"
