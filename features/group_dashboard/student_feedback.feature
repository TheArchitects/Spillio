Feature: See feedback and grade
	As a student member of a group
	I want to be able to see the grade we received from instructor
	So that I can make improvement on the project

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



	Scenario: Grade was submitted by instructor
		Given I am on the "Group Dashboard" page
		Then I should see '10/20' as a score


	Scenario:
		Given the instructor did not submit the grade
		When I follow the 'It1-2' accordion
		Then I should see 'N/A' as a score
