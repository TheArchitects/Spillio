Feature: Go to a specific group from admin page
  As a class admin
  I want to be able to see all the groups and have access to anyone
  So that I can see the progress of the group and grade assignments

  Background: I am a logged in admin on the dashboard
    Given settings set
    And I am logged in as admin
    And the following groups exist:
    | id | group_name     |
    | 33 | Alfonso's group|
    | 77 | Kayvan's group |
    | 44 | Arturo's group |
    And I am on the admin panel page

  Scenario: Seeing all the groups
    Then I should see "Alfonso's group"
    Then I should see "Kayvan's group"
    Then I should see "Arturo's group"

  Scenario: Go to any group
    When I click "Alfonso's group" link
    Then I should be on the group dashboard page for group id "33"
