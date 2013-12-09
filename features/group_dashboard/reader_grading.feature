Feature: Grade student's submission
  As an assigned reader to a group
  I want to grade the submission of group on a particular assignment
  So that students in that group can see their grades and feedback

  Background: I am a logged in student in my group dashboard
    Given settings set
    
    And the following group exists:
    | id |  group_name |
    | 78 |  Monkees    |

    And the following students exist:
    | id | name | group_id | cid |
    | 88 | John |          | 456 |
    | 77 | Joe  | 78       | 789 |

    And the following tasks exist:
    | id | title | due_date           | description |
    | 91 | It1-1 | 2011-10-1 00:00:00 | Blah        |

    And the following assignments exist:
    | id | group_id | task_id | max_grade|
    | 89 | 78       | 91      | 20|

    And the following submissions exist:
    | label  | assignment_id | content | submitted_date       |
    | Essay  | 89            | Bleh    | 2011-10-1 00:00:00   |
    
    Given it is currently 2013-9-2 00:00:00

  Scenario: Reader should be able to gread the assignments
    Given the student with cid "456" is a reader for "78"
    And  I am logged in with cid "456"
    Given I am on the group dashboard page for group id "78"
    Given I fill in "grade" with "5" within "#assignment-89"
    Given I fill in "feedback" with "very good" within "#assignment-89"
    And I press "Save" button within "#assignment-89"
    Then I should see "Grade has been saved."
  

