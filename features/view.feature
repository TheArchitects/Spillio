Feature: view information in my user profile
  As a student or an instructor
  So that I can make sure my information is up-to-date
  I want to see my profile page with my information

Background: my information has been entered

  Given "Jalal" is logged in

  And "Jalal" has the following information:
  |Name  |Skills  |Current Courses  |Past Courses  |Section Number  |Interests  |Notes to Classmates  |
  |Jalal |Java,C  |CS169,CS186      |CS162,CS161   |2               |Running    |Free on weekends     |

  And I am on the Spillio home page

Scenario: display my user information
  When I click "View my profile",
  Then I should see "Jalal" listed as "Name"
  And I should see "Java,C" listed as "Skills"
  And I should see "CS169,CS186" listed as "Current Courses"
  And I should see "CS162,CS161" listed as "Past Courses"
  And I should see "2" listed as "Section number"
  And I should see "Running" listed as "Interests"
  And I should see "Free on weekends" listed as "Notes to Classmates"
  And I should see a button for "Edit my information"
  And I should not see other people's information
  And I should not see the project list

