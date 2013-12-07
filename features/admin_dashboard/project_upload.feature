Feature: Project Upload
  As an instructor for the CS 169 Course
  I want to be able to post a project
  So that students can decide which client they want to work with


  Background: I am a logged in admin on the dashboard
    Given settings set
	  Given the following instructor exists:
	  | id | name    |
	  | 3  | Robocop |

    And I am logged in as "Robocop"

    Scenario: Post "Cool Project" for all groups to see
    Given I am on the dashboard
    And I click on "Add Project" in the sidebar
    And I fill in "Name" with "Cool Project"
    And I fill in "Description" with "Information about the Project"
    And I fill in "Contact Info" with "(777)777-7777"
    And I click "Submit"
    Then I should see "New Project Added!"
