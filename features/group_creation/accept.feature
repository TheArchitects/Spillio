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
    

  Scenario: Accept a request to join someone's group
    Given I am logged in with cid "44444"
    Given there is a request to join from "Kevin" to "Kayvan"
    And I am on the profile page for "Kayvan"
    Then show me the page
    And I click "Accept Kevin join request" link
    Then I should be on the Group Page for "Kayvan"
    And I should see "Request from Megumi Accepted"
