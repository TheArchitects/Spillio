Feature: View instructors assigned groups
  As an instructor
  I want to be able to see what groups I am in charge of
  So I can quickly navigate through them and monitor how are they going

  Background: I am a logged in instructor with some groups assigned
    Given settings set
    Given the following instructors exist:
    | name    |
    | Robocop |
    | KITT    |

    And the following groups exist:
    | group_name       |
    | Backstreet Buoys |
    | Space Girls      |
    | N Sunk           |

    And group "Backstreet Buoys" is assigned to "Robocop"
    And group "Space Girls" is assigned to "Robocop"
    And group "N Sunk" is assigned to "KITT"

  Scenario: See my assigned groups
    Given I am logged in as instructor "Robocop"
    And I am on the "View my groups" page
    Then I should see "Backstreet Buoys"
    And I should see "Space Girls"
    And I should not see "N Sunk"

  Scenario: Clicking on a group
    Given I am logged in as instructor "Robocop"
    And I am on the "View my groups" page
    And I click on "Backstreet Buoys"
    Then I should be on the "Group Dashboard" page
    And I should see "Backstreet Buoys"
