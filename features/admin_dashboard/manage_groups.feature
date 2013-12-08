Feature: Assign groups to a reader
  As a class administrator
  I want to be able to assign groups to TAs or Readers
  So TAs can work with groups and give them feedback

  Background:
    Given settings set
    And I am logged in as admin
    And the following groups exist:
    | id | group_name     |
    | 33 | Alfonso's group|
    | 77 | Kayvan's group |
    | 44 | Arturo's group |
    
    Given the following users exist:
    | name   | about | cid   | interest|
    | Kevin  | about | 33333 | interest|
    | Kayvan | about | 44444 | interest|
    Given the student with cid "33333" is a reader
    Given the student with cid "44444" is a reader
    And I am on the admin panel page


  Scenario: Assign a group to a reader
    When I click "Group Management" link
    When I select "Kevin" from group reader for "33"
    And I press "Apply Changes" button
    Then I should see "Changes to group readers have been saved."

  Scenario: change group size
    Given the group size is 3
    When I fill in "group_size" with "5"
    And I press "Apply Changes" button
    Then I should see "Current size is 5"

