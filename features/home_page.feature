Feature: Home redirection
  As a user who has previously logged in
  I want to get redirected to my profile page when I go to the homepage
  So that I can save time

  Scenario: redirecting loggedin users
	Given the following users exist:
    | name   | about | group_id | cid   | interest|
    | Kevin  | about |          | 33333 | interest|
    And I am logged in with cid "33333"
    And I am on the home page