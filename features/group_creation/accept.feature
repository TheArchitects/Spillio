Feature: Respond to someone's request to join a group
  As a student and member of a group
  I want to accept or reject join requests
  So that I can select the people I am going to work with

  Background: I am on the Home Page
    Given settings set
    Given there is a request to join "Megumi"

  Scenario: Accept a request to join someone
    Given I am on the Home Page
    And there is a request to join "Megumi"
    And I click "Accept Request" under the request from "Megumi"
    Then I should be redirected to my Group Page
    And I should see "Request from Megumi Accepted"
