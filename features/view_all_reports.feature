Feature: Viewing cab requests
  In order to keep track of all cab requests
  An Admin
  should be able to view cab requests

  Scenario: Admin views all cab requests
    Given User is logged in
    And   Current User is Admin
    And   User is on the support centers show page
    And   User fills in from_date as 07/02/9999
    And   User fills in to_date as 23/12/9999
    When  User display reports
    Then  User should be able to view all cab requests
    And   User should be able to view 'Download XLS Sheet' link
    And   User should be able to view 'back' link