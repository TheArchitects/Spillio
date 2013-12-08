Feature: search for potential group members
  As a student
  I want to be able to search for profiles of other students based on their skills, section number, past courses, etc.
  So that I can better decide who to join in a team

  Background: Students have already created Spillio User Profiles

    Given the following students exist:
    | name   | about       | group_id | cid   | interest |
    | Kevin  | bananas     |          | 33333 | interest |
    | Kayvan | about       | 77       | 44444 | interest |
    | Alfonso| I rule      | 33       | 55555 | interest |
    | Jalal  | about       | 33       | 66666 | interest |

    And the following groups exist:
    | id | group_name     |
    | 33 | Alfonso's group|
    | 77 | Kayvan's group |

    And I am logged in with cid "44444"

  Scenario: I should see a list of all the students and some extra info of them
    Given I am on the Search for Students Page
    Then I should see "Kayvan" within "#44444"
    And I should see "Jalal"
    And I should not see "33333"
    And I should see "I rule" within "#55555"
    And I should not see "Group" within "#33333"
    And I should see "Group" within "#55555"

  Scenario: search should return students whose name contains the search query, case unsensitive
    Given I am on the Search for Students Page
    And I search for "al"
    Then I should be on the Search for Students Page
    And I should see "Jalal"
    And I should see "Alfonso"
    And I should not see "Kayvan" within "#results"
    And I should not see "Kevin"

  Scenario: search for non existing terms should tell the user nothing was found
    Given I am on the Search for Students Page
    And I search for "Torrent for DBZ s02e22"
    Then I should be on the Search for Students Page
    And I should see "No results found"