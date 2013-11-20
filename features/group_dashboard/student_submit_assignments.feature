Feature: Submit Assignments
	As a student member of a group
	I want to see what deliverables of the project the group needs to submit and how I can submit
	So that I can submit the project

Background: I am a logged in student in my group dashboard
	Given the following instructor exists:
	| id | name    |
	| 3  | Robocop |

	And the following group exist:
	| id | instructor_id |
	| 1  | 3             |

	And the following students exist:
	| id | name | group_id |
	| 1  | Pepe | 1        |
	| 2  | John | 1        |

	And the following iterations exist:
	| id | title | due_date           | score | description | group_id |
	| 1  | It1-1 | 2011-10-1 00:00:00 | 10/20 | Blah        | 1        |
	| 2  | It1-2 | 2013-10-1 00:00:00 | nil   | Derp derp   | 1        |

	And the following submission_fields exist:
	| id | type | label  | iteration_id | content | submitted_at       |
	| 1  | text | Essay  | 1            | Bleh    | 2011-10-1 00:00:00 |
	| 2  | url  | Heroku | 2            | nil     | nil                |

	And the following posts exist:
	| id | author | published_at       | iteration_id |
	| 1  | 1      | 2011-10-1 00:00:00 | 1            |
	| 2  | 3      | 2011-10-2 00:00:00 | 2            |



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
