Feature: View and Grade assignments
  As an instructor in charge of a group
  I want to be able to post grades to their submissions
  So students can see how well they did on them

  Background: I am a logged in instructor with a group assigned which has some prefilled data
    Given the following instructor exists:
    | name    |
    | Robocop |

    And the following group exists:
    | group_name       |
    | Backstreet Buoys |

    And the following student exists:
    | name         |
    | Little Timmy |
    | John Cobra   |

    And group "Backstreet Buoys" has "Little Timmy", "John Cobra" as members
    And group "Backstreet Buoys" is assigned to "Robocop"

    And the following task exists:
    | title | description  | due_date            |
    | It1-1 | Work for us! |  2011-10-1 00:00:00 |

    And the following submission exists:
    | label | content   |
    | Url   | www.a.com |

    And an assignment exists for task "It1-1" and group "Backstreet Buoys" with submission "Url" and max score of "10"

  Scenario: See the submissions for an assignments
    Given I am logged in as instructor "Robocop"
    And I am on the "Group Dashboard for Backstreet Buoys" page
    Then I should see "Url" within "Submissions"
    And I should see "www.a.com"

  Scenario: Grade an assignment
    Given I am logged in as instructor "Robocop"
    And I am on the "Group Dashboard for Backstreet Buoys" page
    And I fill "score_amount" with "5" within "assignment-It1-1"
    And I click on "save" within "assignment-It1-1"
    Then I should see "5 out of 10"