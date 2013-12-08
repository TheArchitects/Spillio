Feature: Assign groups to instructors
  As a class administrator
  I want to be able to assign groups to TAs
  So TAs can work with groups and give them feedback

  Background: I am a logged in admin in the dashboard
    Given settings set

	  And the following group exists:
	  |group_name | id |instructor_id |
  	|group_a    | 27 |88            |

	  And the following students exist:
	  |id |name |group_id |
	  |45 |Pepe |27       |
	  |64 |John |27       |

  Scenario: Assign Robocop to group_a
    Given I am on the dashboard
    And I click on "Group Management" in the sidebar
    And I select "Robocop" under "Assigned to" for "group_a"
    And I press "Save"
    Then I should see "Changes Made Successfully"
    And I should see "group_a assigned to "Robocop"
