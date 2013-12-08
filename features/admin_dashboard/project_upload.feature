Feature: Project Upload
  As an instructor of the CS 169 Course
  I want to be able to post a list of project options
  So that students can decide which projects they prefer to work in


  Background: I am a logged in admin on the dashboard
    Given settings set
    And I am logged in as admin
    And the following groups exist:
    | id | group_name     |
    | 33 | Alfonso's group|
    | 77 | Kayvan's group |
    | 44 | Arturo's group |

    Given the following users exist:
    | name   | about | cid   | interest|
    | Kevin  | about | 33333 | interest|
    | Kayvan | about | 44444 | interest|
    Given the student with cid "33333" is a reader
    Given the student with cid "44444" is a reader
    And I am on the admin panel page

  Scenario: Empty list of projects
    When I click "Project Management" link
    Then I should be on the admin project management page
    And I should see "No projects yet. Please import some" within "#project-list"

  Scenario: Post "Cool Project" for all groups to see
    When I click "Project Management" link
    Then I should be on the admin project management page
    When I fill in "Name" with "Cool Project" within "#new-project"
    And I fill in "Description" with "This project is nuts" within "#new-project"
    And I fill in "Contact Info" with "schwagger@hotmail.com" within "#new-project"
    And I press "Submit Assignment" button
    Then I should be on the admin project management page
    And I should see "Cool Project added!"
    And I should see "Cool Project" within "#project-list"
    And I should see "This project is nuts" within "#project-list"
    And I should see "schwagger@hotmail.com" within "#project-list"