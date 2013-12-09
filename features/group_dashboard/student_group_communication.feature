Feature: View assignments due
  As a student member of a group
  I want a common place where to see all my group's pending assignments and when they are due
  So that I can quickly know what we have to do

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

  Scenario: I should be able to input questions
    Given I fill in "content" with "when are you free to meet" within "#assignment-89"
    And I press "Post" button within "#assignment-89"
    Then I should be on the group dashboard page for cid "123"
    And I should see "when are you free to meet" within "#assignment-89"

  Scenario: I should see the reader's response in group dashboard
    Given the student with cid "456" is a reader for "78"
    And  I am logged in with cid "456"
    Given I am on the group dashboard page for group id "78"
    Given I fill in "content" with "Today works for me" within "#assignment-89"
    And I press "Post" button within "#assignment-89"
    Then I should see "John" within "#assignment-89 .messages"
    And I should see "such content"

  Scenario: Admin should not be able to post on discussions
    Given I am logged in as admin
    Given I am on the group dashboard page for group id "78"
    Given I fill in "content" with "Lets see how it works" within "#assignment-89"
    And I press "Post" button within "#assignment-89"
    Then I should see "Admin can not post here"
