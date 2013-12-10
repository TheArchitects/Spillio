Feature: View reader's assigned groups
  As a reader
  I want to be able to see what groups I am in charge of
  So I can quickly navigate through them and monitor how are they going

  Background: I am a logged in as a reader with some groups assigned
    Given settings set

    And the following group exists:
    | id |  group_name |
    | 78 |  Monkees    |
    | 79 |  Bunnies    |

    And the following students exist:
    | id | name | cid |
    | 88 | John | 456 |
    | 77 | Joe  | 789 |
    | 66 | Jake | 123 |
    Given the student with cid "456" is a reader for "78"
    Given the student with cid "789" is a reader for "79"


  Scenario: See my assigned groups
    When  I am logged in with cid "456"
    And I am on the view my groups page
    Then I should see "Monkees"
    When  I am logged in with cid "789"
    And I am on the view my groups page
    Then I should see "Bunnies"

  Scenario: Clicking on a group
    When  I am logged in with cid "456"
    And I am on the view my groups page
    And I click "Monkees" link
    Then I should be on the group dashboard page for group id "78"

  Scenario: No result
    Given the student with cid "123" is a reader
    When  I am logged in with cid "123"
    And I am on the view my groups page
    Then I should see "There is no group assigned to you yet."
