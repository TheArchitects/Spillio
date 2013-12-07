Feature: Admin's permissions
  As an administrator
  I want to everyone else dont have access to admin panel
  So they can not change any thing that they are not suppose to


  Background:
    Given settings set
    Given the following users exist:
    | name   | about | group_id | cid   | interest|
    | Kevin  | about |          | 33333 | interest|

    Scenario: I should not have access to admin panel
      Given I am logged in with cid "33333"
      Given I am on the admin panel page
      Then I should see "The page you were looking for doesn't exist"

    Scenario: I should not have access to admin panel
      Given I am logged in as admin
      Given I am on the admin panel page
      Then show me the page
      Then I should see "Group Management"
      And I click "Group Management" link
      Then I should see "General Group Settings"
      
      Then I should see "New Assignment"
      And I click "New Assignment" link
      Then I should see "Create new assignment"
      
      
