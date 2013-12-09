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

    And I am on the admin panel page

  Scenario: Empty list of projects
    When I click "Project Management" link
    Then I should see "No projects yet. Please import some" within "#project-list"

  Scenario: Post "Cool Project" for all groups to see
    When I click "Project Management" link
    And I fill in "Title" with "Cool Project" within "#new-project"
    And I fill in "Project Portal url" with "http://url.com" within "#new-project"
    And I press "Import project" button
    Then I should see "Cool Project added!"
    And I should see "Cool Project" within "#project-list"
    And I should see "No group assigned yet" within "#project-list"