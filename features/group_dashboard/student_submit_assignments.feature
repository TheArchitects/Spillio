Feature: Submit Assignments
  As a student member of a group
  I want to see what deliverables of the project the group needs to submit and how I can submit
  So that I can submit the project

  Background: I am a logged in student in my group dashboard
    Given settings set
    
    And the following group exists:
    | id |  group_name |
    | 78 |  Monkees    |
    | 46 |  Bunnies    |

    And the following students exist:
    | id | name | group_id | cid |
    | 99 | Pepe | 78       | 123 |
    | 88 | John |          | 456 |
    | 77 | Joe  | 46       | 789 |

    And the following tasks exist:
    | id | title | due_date           | description |
    | 91 | It1-1 | 2013-10-1 00:00:00 | Blah        |
    | 92 | It1-2 | 2014-10-1 00:00:00 | Derp derp   |

    And the following assignments exist:
    | id | group_id | task_id | max_grade|
    | 89 | 78       | 91      | 20|
    | 53 | 78       | 92      | 10|

    And the following submissions exist:
    | label  | assignment_id | content | submitted_date       |
    | Essay  | 89            | Bleh    | 2011-10-1 00:00:00   |
    | Heroku | 53            |         |                      |

    And the following posts exist:
    | author_id  | published_at       | assignment_id    | content     |author_id|
    | 99         | 2011-10-1 00:00:00 | 89               | such content|99|
    | 43         | 2011-10-2 00:00:00 | 53               |  wow        |88|

    Given it is currently 2013-9-2 00:00:00
    Given I am logged in with cid "123"
    Given I am on the group dashboard page for cid "123"


  Scenario: First time submit
    When I fill in "Heroku" with "bananas"
    And I press "Save" button
    Then I should see "bananas"
    And I should not see "#submission_content" within "#assignment-53"

  Scenario: Not first time submit
    Then I should not see "#submission_content" within "#assignment-89"
