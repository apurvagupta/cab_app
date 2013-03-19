Feature: Viewing cab requests
  In order to keep track of all cab requests
  An Admin
  should be able to view cab requests

  Scenario: View all cab requests
    Given Admin is logged in
    And   Admin fills in "from" date
    And   Admin fills in "to" date
    When  Admin display reports
    Then  User should be able to view all cab requests
    And   User should be able to view "Download Excel Sheet" link
    And   User should be able to view "back" link