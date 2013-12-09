Feature: Post new task
  As a class administrator
  I want to be able to assign new assignment
  So that students have know what they are expected to do

  Background: I am a logged in admin on the dashboard
    Given settings set
    And the following groups exist:
    | id | group_name     |
    | 33 | Alfonso's group|

    Given the following student exist:
    | name   | about | cid   | interest| group_id|
    | Kevin  | about | 33333 | interest|  33     |

    Given I am logged in as admin
    Given I am on the admin panel page

  Scenario: Post "Iteration1-1" for all groups
    When I click "Assignment Management" link
    And I fill in "title" with "Iteration1-1"
    And I fill in "description" with "3 User Stories with Pivotal Tracker and Cucumber Tests"
    And I fill in "assignment_max_grade" with "20"
    And I fill in "due_date" with "5/1/2014"
    And I fill in "submission_labels[]" with "Pivotal Tracker Link,Field with User Stories and Cucumber Tests"
    And I press "Submit Assignment" button
    Then I should see "Assignment sent to all groups"
    Given I am logged in with cid "33333"
    And I am on the group dashboard page for group id "33"
    Then I should see "Iteration1-1"
