Feature: See feedback and grade
	As a student member of a group
	I want to be able to see the grade we received from instructor	
	So that I can make improvement on the project
	
	Background: I am a logged in student in my group dashboard
		Given the following instructor exists:
		| id | name    |
		| 3  | Robocop |

		And the following group exist:
		| id | instructor_id |
		| 1  | 3             |
		#SQLite3::ConstraintException: PRIMARY KEY must be unique: INSERT INTO "users"
		#And the following students exist:
		#| id | name | group_id |
		#| 1  | Pepe | 1        |
		#| 2  | John | 1        |


		And the following students exist:
		| name | group_id |
		| Pepe | 1        |
		| John | 1        |

		#modified assignment model , added the following fields :id, :score, :group_id
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



	Scenario: Grade was submitted by instructor
		Given 'It1-1' past its due date
		And the instructor did submit the grade 
		When I follow the 'It1-1' accordion
		Then I should see '10/20' as a score

	Scenario:
		Given the instructor did not submit the grade 
		When I follow the 'It1-2' accordion
		Then I should see 'N/A' as a score
