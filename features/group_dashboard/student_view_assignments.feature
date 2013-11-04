Feature: View assignments due
  As a student member of a group
  I want a common place where to see all my group's pending assignments and when they are due
  So that I can quickly know what we have to do

  Background: I am a logged in student in my group dashboard
    Given the following instructor exists:
    | id | name    |
    | 3  | Robocop |

    Given the following group exist:
    | id | instructor_id |
    | 1  | 3             |

    Given the following students exist:
    | id | name | group_id |
    | 1  | Pepe | 1        |
    | 2  | John | 1        |

    Given the following iterations exist:
    | id | title | due_date           | score | description | group_id |
    | 1  | It1-1 | 2011-10-1 00:00:00 | 10/20 | Blah        | 1        |
    | 2  | It1-2 | 2013-10-1 00:00:00 | nil   | Derp derp   | 1        |

    Given the following submission_fields exist:
    | id | type | label  | iteration_id | content | submitted_at       |
    | 1  | text | Essay  | 1            | Bleh    | 2011-10-1 00:00:00 |
    | 2  | url  | Heroku | 2            | nil     | nil                |

    Given the following posts exist:
    | id | author | published_at       | iteration_id |
    | 1  | 1      | 2011-10-1 00:00:00 | 1            |
    | 2  | 3      | 2011-10-2 00:00:00 | 2            |

    Given I am logged into the student group dashboard

