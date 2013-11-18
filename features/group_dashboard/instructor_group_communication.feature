Feature: Communicate with group
  As an instructor in charge of a group
  I want to be able to communicate with the group members
  So I can answer their questions, provide feedback...

  Background: I am a logged in student in my group dashboard
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
    | title | description  | due_date           |
    | It1-1 | Work for us! | 2011-10-1 00:00:00 |

    And the following submission exists:
    | label | content   |
    | Url   | www.a.com |

    And an assignment exists for task "It1-1" and group "Backstreet Buoys" with submission "Url" and max score of "10"

  Scenario: I should be able to send messages
    Given I am logged in as instructor "Robocop"
    And I am on the "Group Dashboard for Backstreet Buoys" page
    And I fill "message" with "random garbage" within "assignment-It1-1"
    And I click on "save" within "assignment-It1-1"
    Then I should see "5 out of 10"
    And I should be on the "Group Dashboard for Backstreet Buoys" page
    And I should see "random garbage" within "assignment-It1-1 .content"