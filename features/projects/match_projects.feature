Feature: Match Projects
  As an instructor of the CS 169 Course
  I want to be able to match groups with projects
  So students know which client they will work with

  Background: I am a logged in as a user
    Given settings set
    And I am logged in as admin
    And the following groups exist:
    | id | group_name     |
    | 33 | Alfonso's group|

    Given the following project_join_requests exist:
    |group_id |project_id |priority |
    |33       |1          |1        |

    Given the following projects exist:
    |id |title              |description      | url                  |
    |1  |An awesome projects|Join our project!|http://www.awesome.com|

  Scenario:
    Given I am on the admin panel page
    Then I click "Match Groups" link
    And I click "Project Management" link
    Then I should see "Alfonso's group"
