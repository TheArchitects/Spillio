Feature: Submit Assignments
  As a student member of a group
  I want to see what deliverables of the project the group needs to submit and how I can submit
  So that I can submit the project

  Background: I am a logged in student in my group dashboard
    Given settings set
    Given the following instructor exists:
    | id | name    |
    | 43 | Robocop |

    And the following group exists:
    | id | instructor_id |
    | 78 | 43            |

    And the following students exist:
    | id | name | group_id |
    | 99 | Pepe | 78       |
    | 88 | John | 78       |

    And the following tasks exist:
    | id | title | due_date           | description |
    | 91 | It1-1 | 2011-10-1 00:00:00 | Blah        |
    | 92 | It1-2 | 2013-10-1 00:00:00 | Derp derp   |

    And the following assignments exist:
    | id | group_id | task_id |
    | 89 | 78       | 91      |
    | 53 | 78       | 92      |

    And the following score exists:
    | id | max_score | score | assignment_id |
    | 21 | 20        | 10    | 89            |
    | 22 | 30        | nil   | 53            |

    And the following submissions exist:
    | label  | assignment_id | content | submitted_date       |
    | Essay  | 89            | Bleh    | 2011-10-1 00:00:00   |
    | Heroku | 53            | nil     | nil                  |

    And the following posts exist:
    | author_id  | published_at       | assignment_id    | content |
    | 99         | 2011-10-1 00:00:00 | 89              | such content    |
    | 43         | 2011-10-2 00:00:00 | 53            |  wow  |



	Scenario: First time submit
		Given I did not submit the assignment
		And the iteration accordion is not collapsed
		Then I should see the "description" form
		And the 'submit' button
		When I fill "description" with "submission content"
		And I press 'submit'
		Then I should see "submission content"
		And I should not see the "description" form

	Scenario: Not first time submit
		Given I did submit the assignement
		And the iteration accordion is not collapsed
		Then I should not see the "description" form
