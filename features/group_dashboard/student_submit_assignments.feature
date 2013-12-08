Feature: Submit Assignments
  As a student member of a group
  I want to see what deliverables of the project the group needs to submit and how I can submit
  So that I can submit the project

  Background: I am a logged in student in my group dashboard
    Given settings set
    And the following group exists:
    | id | instructor_id |
    | 78 | 43            |

    And the following students exist:
    | id | name | group_id | cid |
    | 99 | Pepe | 78       | 123 |
    | 88 | John | 78       | 456 |

    And the following tasks exist:
    | id | title | due_date           | description |
    | 91 | It1-1 | 2011-10-1 00:00:00 | Blah        |
    | 92 | It1-2 | 2013-10-1 00:00:00 | Derp derp   |

    And the following assignments exist:
    | id | group_id | task_id |
    | 89 | 78       | 91      |
    | 53 | 78       | 92      |

    And the following submissions exist:
    | label  | assignment_id | content | submitted_date       |
    | Essay  | 89            | Bleh    | 2011-10-1 00:00:00   |
    | Heroku | 53            |      |                   |

    And the following posts exist:
    | author_id  | published_at       | assignment_id    | content |
    | 99         | 2011-10-1 00:00:00 | 89              | such content    |
    | 43         | 2011-10-2 00:00:00 | 53            |  wow  |

    Given I am logged into the student group dashboard as "123"


  Scenario: First time submit
    When I fill in "Heroku" with "bananas"
    And I press "Save" button
    Then I should see "bananas"
    And I should not see "#submission_content" within "#assignment-53"

  Scenario: Not first time submit
    Then I should not see "#submission_content" within "#assignment-89"
