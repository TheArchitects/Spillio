Feature: search for potential group members
  As a student
  I want to be able to search for profiles of other students based on their skills, section number, past courses, etc.
  So that I can better decide who to join in a team

Background: Students have already created Spillio User Profiles

  Given I am logged in as a student
  And the following User Profiles exist on Spillio:
  |Name  |Skills  |Current Courses  |Past Courses  |Section Number  |Interests  |Notes to Classmates  |
  |Kayvan|Java    |CS162            |CS170         |1               |Sports     |                     |
  |Kevin |C       |CS150            |CS160         |1               |Games      |                     |
  |Alfonso|Ruby   |CS154            |CS174         |2               |Reading    |                     |

  And I am on the Spillio search page

Scenario: find users based on Past Courses
  When I enter "CS170" into "Past Courses"
  And I click "Find"
  Then I should be on the "User Profile Results" page
  And I should see "Alfonso"
  And I should not see "Kevin"
  And I should not see "Kayvan"

Scenario: find users based on Skills
  When I enter "Java" into "Skills"
  And I click "Find"
  Then I should be on the "User Profile Results" page
  And I should see "Kayvan"
  And I should not see "Kevin"
  And I should not see "Alfonso"

Scenario: find users based on Section Number
  When I enter "1" into "Section Number"
  And I click "Find"
  Then I should be on the "User Profile Results" page
  And I should see "Kayvan"
  And I should see "Kevin"
  And I should not see "Alfonso"

