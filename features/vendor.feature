Feature: Creating a new Vendor
  In order to create a new vendor
  An Admin
  should be able to submit a new vendor

  Scenario: Create New Vendor
    Given Admin is logged in
    And   Admin is on 'new vendor' page
    And   Admin fills in "name" as "boogaBooga"
    And   Admin fills in "contact_no" as "1234567890"
    When  Admin creates a new vendor
    Then Admin should be able to view all vendors including this one
    And   Admin should be able to view 'edit' link for each admin
    And   Admin should be able to view 'new' link
    And   Admin should be able to view 'back' link