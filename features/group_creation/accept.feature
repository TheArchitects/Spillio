Feature: Respond to someone's request to join a group
  As a student and member of a group
  I want to accept or reject join requests
  So that I can select the people I am going to work with

  Background: I am on the Home Page
    Given settings set
    Given the following users exist:
    |name   | about | group_id |cid  | about| interest|
    |Kevin  | about |          |33333| about| interest|
    |Kayvan | about | 77       |44444| about| interest|
    |Alfonso| about | 33       |55555| about| interest|
    |Jalal  | about | 33       |66666| about| interest|

    And the following groups exist:
    | id | group_name     |
    | 33 | Alfonso's group|
    | 77 | Kayvan's group |
    

  Scenario: Accept a request to join someone's group
    Given I am logged in with cid "44444"
    Given there is a request to join from "Kevin" to "Kayvan"
    And I am on the profile page for "Kayvan"
    And I click "Accept Kevin join request" link
    Then I should be on the group Page for "Kayvan"
    And I should see "Kevin"

  Scenario: Accept an invitation someone's group
    Given I am logged in with cid "33333"
    Given there is an invitation to join from "Kayvan" to "Kevin"
    And I am on the profile page for "Kevin"
    And I click "Accept Kayvan invite request" link
    Then I should be on the group Page for "Kayvan"
    And I should see "Kevin"

  Scenario: Accept a merge request to another group
    Given I am logged in with cid "55555"
    Given there is a request to merge from "Kayvan" to "Alfonso"
    And I am on the profile page for "Alfonso"
    And I click "Accept Kayvan merge request" link
    Then I should be on the group Page for "Kayvan"
    Then show me the page
    And I should see "Alfonso"


  Scenario: maximum group size reached
    Given I am logged in with cid "55555"
    Given there is a request to merge from "Alfonso" to "Kayvan"
    Then show me the page
    And I click "Accept Alfonso merge request" link
    And I should see ""