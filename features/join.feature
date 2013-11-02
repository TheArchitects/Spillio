Feature: create a group with my classmates
  As a student
  I want to request to join groups and accept requests
  So that I can form a project group

  Background: I am on the Home Page
    Given: I am signed in as "Jalal"

  Scenario: Send a request to someone who is not in a group
    Given I am on the Search for Students page
    And I click on "Jalal" in the list of students
    Then I should be on the View Profile Page for Jalal
    Then I click on "Join Me in a Group"
    Then I should be on "Request Sent Page"
    And I should see "Request Sent"

  Scenario: Send a request to someone who is in an existing group
    Given I am on the Search for Students page
    And I click on "Jalal" in the list of students
    Then I should be on the View Profile Page for Jalal
    Then I click on "Join My Group"
    Then I should be on "Request Sent Page"
    And I should see "Request Sent"

  Scenario: Accept a request to join someone
    Given I am on the Home Page
    And there is a request to join "Megumi" under "Incoming Requests"
    And I click "Accept Request" under the request from "Megumi"
    Then I should be redirected to my Group Page
    And I should see "Request from Megumi Accepted"

  Scenario: I should see Outgoing Group Requests on my Home Page
    Given I am on the Home Page
    And I have requested to join Groups "Cool Project,Nice Project"
    Then I should see a request to join "Cool Project" under "Outgoing Requests"
    And I should see a request to join "Nice Project" under "Outgoing Requests"

  Scenario: I should see Incoming Group Requests on my Home Page
    Given I am on the Home Page
    And I have received request(s) from "Megumi,Alfonso"
    Then I should see a request to join "Megumi" under "Incoming Requests"
    And I should see a request to join "Alfonso" under "Incoming Requests"
