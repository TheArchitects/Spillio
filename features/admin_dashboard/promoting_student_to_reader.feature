Feature: Promoting a student to a reader
  As a class admin
  I want to be able to give reader access to my "reader students"
  So that they can grade assignments in the assigned groups

  Background: I am a logged in admin on the dashboard
    Given settings set
    And I am logged in as admin
    Given the following users exist:
    | name   | about | group_id | cid   | interest|
    | Kevin  | about |          | 33333 | interest|

  Scenario: Pormotion link is visible to admin
    Given I am on the profile page for "Kevin"
    Then I should see "Promote to Reader"

  Scenario: promoting a user to become reader
    Given I am on the profile page for "Kevin"
    When I click "Promote to Reader" link
    Then I should see "Kevin became a Reader."
