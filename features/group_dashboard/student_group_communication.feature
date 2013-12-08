Feature: View assignments due
  As a student member of a group
  I want a common place where to see all my group's pending assignments and when they are due
  So that I can quickly know what we have to do

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
    | Heroku | 53            | nil     | nil                  |

    And the following posts exist:
    | author_id  | published_at       | assignment_id    | content |
    | 99         | 2011-10-1 00:00:00 | 89              | wow    |
    | 43         | 2011-10-2 00:00:00 | 53            |  such content  |

    And I am logged into the student group dashboard as "123"

  Scenario: I should be able to input questions
    Given I fill in "content" with "when are you free to meet" within "#assignment-89"
    And I press "Post" button within "#assignment-89"
    Then I should be on the group dashboard page for cid "123"
    And I should see "when are you free to meet" within "#assignment-89"

  Scenario: I should see the instructor's response in group dashboard
    Then I should see "Robocop" within "#assignment-53 .messages"
    And I should see "such content" within "#assignment-53 .messages .content"
