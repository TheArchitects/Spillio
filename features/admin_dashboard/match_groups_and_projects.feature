Feature: Pair projects with groups
  As an instructor for the CS 169 Course
  I want to pair groups with projects
  So that students know which client they will be working with

  Background: I am a logged in admin in the dashboard
    Given settings set
	  Given the following instructor exists:
	  |id |name    |
	  |88 |Robocop |

	  And the following groups exist:
	  |group_name | id |instructor_id |
  	|group_a    | 27 |88            |
    |group_b    | 30 |88            |

    And the following projects exist:
    |project_name |id |
    |cool_project |1  |
    |fun_project  |2  |

    Scenario: Assign all groups to their desired projects
    Given I am on the dashboard
    And I click on "Pair Projects with Groups"
    And "group_a" has listed "cool_project" with a priority of 5
    And "group_b" has listed "fun_project" with a priority of 5
    And "group_a" has listed "fun_project" with a priority of 3
    And "group_b" has listed "cool_project" with a priority of 1
    And I click "Pair!"
    Then I should see "group_a" with "cool_project"
    And I should see "group_b" with "fun_project"
