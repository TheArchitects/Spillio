Feature: Assign groups to instructors
  As a class administrator
  I want to be able to assign groups to TAs
  So TAs can work with groups and give them feedback

  Background: I am a logged in admin in the dashboard
	  Given the following instructor exists:
	  |id |name    |
	  |3  |Robocop |

	  And the following group exist:
	  |name |id |instructor_id |
  	|group_a|1|3             |

	  And the following students exist:
	  |id |name |group_id |
	  |1  |Pepe |1        |
	  |2  |John |1        |

  Scenario: Assign Robocop to group_a
    Given I am on the dashboard
    And I click on "Group Management" in the sidebar
    And I select "Robocop" under "Assigned to" for "group_a"
    And I press "Save"
    Then I should see "Changes Made Successfully"
    And I should see "group_a assigned to "Robocop"
