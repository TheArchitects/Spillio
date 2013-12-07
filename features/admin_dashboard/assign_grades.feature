Feature: Assign grades
  As an instructor in charge of a group
  I want to be able to post grades to their assignments
  So students can see how well they did on them


  Background: I am a logged in admin in the dashboard
    Given settings set
	  Given the following instructor exists:
	  |id |name    |
	  |88 |Robocop |

	  And the following group exists:
	  |group_name | id |instructor_id |
  	|group_a    | 27 |88            |

    Scenario: Assign group_a 20/20 points for iteration-1
      Given I am on the dashboard
      And I click on "group_a" under "My Groups"
      And I click on "Iteration 1"
      And I enter in "20" points
      And I click "submit"
      Then I should see "Grade successfully entered"
