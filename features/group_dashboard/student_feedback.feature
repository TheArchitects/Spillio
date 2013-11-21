Feature: See feedback and grade
	As a student member of a group
	I want to be able to see the grade we received from instructor	
	So that I can make improvement on the project
	
	Background: I am a logged in student in my group dashboard
		Given the following instructor exists:
		| name    |
		| Robocop |

		And the following group exist:
		| instructor_id |
		| 3             |
		#SQLite3::ConstraintException: PRIMARY KEY must be unique: INSERT INTO "users"
		#And the following students exist:
		#| id | name | group_id |
		#| 1  | Pepe | 1        |
		#| 2  | John | 1        |


		And the following students exist:
		| name |
		| Pepe |
		| John |


		And the following submission_fields exist:
		| label  | content |
		| Essay  | Bleh    |
		| Heroku | nil     |

		And the following posts exist:
		| content  | date       		|
		| question | 2011-10-1 00:00:00 |   
		| response | 2011-10-2 00:00:00 |  

		And the following score was received:
		| score |
		|   10  |



	Scenario: Grade was submitted by instructor
		Given I am on the "Group Dashboard" page
		Then I should see '10/20' as a score


	Scenario:
		Given the instructor did not submit the grade 
		When I follow the 'It1-2' accordion
		Then I should see 'N/A' as a score
