Feature: View Projects
  As a student of the CS 169 Course
  I want to be able to see a list of project options
  So that I can decide which projects they prefer to work in


  Background: I am a logged in as a user
    Given settings set
    And I am logged in as admin
    And the following groups exist:
    | id | group_name     |
    | 33 | Alfonso's group|
    | 77 | Kayvan's group |
    | 44 | Arturo's group |

    Given the following users exist:
    | name   | about | group_id | cid   |
    | Kevin  | about |     33   | 33333 |

    Given the following projects exist:
    |title              |description      | url                  |
    |An awesome projects|Join our project!|http://www.awesome.com|

  Scenario: viewing a full projects list
    Given I am logged in with cid "33333"
    Given I am on the projects page
    Then I should see "An awesome projects"