Feature: Assign instructors to Groups
  As an instructor
  I want to assign instructors to project groups
  To evenly divide work among Class TAs

  Background: I am on the View Groups Page
    Given I am signed in as "TA"

  Scenario: Assign TA "Stephanie" to Group "Spillio"
    Given I am on the Search for Groups Page
    And I see the group "Spillio"
    And I select "Stephanie" from the drop down menu in "Spillio"
    And I press "OK"
    Then I should see "TA Stephanie assigned to Group Spillio"
