Feature: Post new task
  As a class administrator
  I want to be able to assign new tasks
  So that students have know what they are expected to do

  Background: I am a logged in admin on the dashboard
    Given settings set
	  Given the following instructor exists:
	  | id | name    |
	  | 3  | Robocop |

    And I am logged in as "Robocop"

  Scenario: Post "Iteration1-1" for all students
    Given I am on the dashboard
    And I click on "New Assignment" in the sidebar
    And I fill in "Description" with "3 User Stories with Pivotal Tracker and Cucumber Tests"
    And I fill in "Due Date" with "5/1/2014"
    And I fill in "Fields to Submit" with "Pivotal Tracker Link,Field with User Stories and Cucumber Tests"
    And I click "Save"
    Then I should see "New Task Successfully Posted"
    And I should see "3 User Stories with Pivotal Tracker and Cucumber Tests" under "Description"
    And I should see "5/1/2014" under "Due Date"
    And I should see "Pivotal Tracker Link,Field with User Stories and Cucumber Tests" under "Fields to Submit"
