Feature: Request to join an existing group
  As a student
  I want to request to join an existing group
  So that I can form a project group

  Background: I am on the Search for Students page
    Given settings set
    And the following users exist:
    |name   | about  | group_id |cid  | about| interest|
    |Megumi |  about |          |11111| about| interest|
    |Kevin  |  about | 77       |22222| about| interest|
    |Alfonso| about  | 33       |33333| about| interest|
    |Kayvan |  about | 77       |44444| about| interest|

    And the following groups exist:
    | id |group_name     |
    | 33 | Alfonso's group|
    | 77 | Kevin's group  |

  Scenario: Send an invitation to someone who is not in a group
    Given I am logged in with cid "33333"
    And I am on the search for students page
    When I click "11111" link within "#results"
    Then I should be on the user profile page for "Megumi"
    When I press "Invite to group" button
    Then I should see "Request pending"

  Scenario: Send a join request to someone who is in an existing group
    Given I am logged in with cid "11111"
    And I am on the search for students page
    When I click "22222" link within "#results"
    And I press "Request to join" button
    Then I should see "Request pending"

  Scenario: Send a merge request to someone who is in an existing group
    Given I am logged in with cid "33333"
    And I am on the search for students page
    When I click "22222" link within "#results"
    And I press "Request to merge" button
    Then I should see "Request pending"

  Scenario: Try to send a request to groupmate
    Given I am logged in with cid "44444"
    And I am on the search for students page
    When I click "22222" link within "#results"
    Then I should see "Already a groupmate"

  Scenario: Group is full
    Given the following users exist:
    |name  | about | group_id|cid   | interest|
    | admin| some  |         | 00000|      |
    |Arturo|  about| 77      |99999 | interest|

    Given I am logged in with cid "11111"
    And I am on the search for students page
    When I click "22222" link within "#results"
    Then I should see "Group is full"
